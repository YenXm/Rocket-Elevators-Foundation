# frozen_string_literal: true

class ApplicationController < ActionController::Base
    protect_from_forgery prepend: true, with: :exception
    # protect_from_forgery with: :null_session
    

    def authenticate_employee_user!
        authenticate_user!
        unless current_user.employees.exists?
            flash[:flash] = 'Unauthorized Access!'
            redirect_to root_path
        end
    end

    SecureHeaders::Configuration.default do |config|
        # Add "; preload" and submit the site to hstspreload.org for best protection.
        config.hsts = "max-age=#{1.week.to_i}"
        config.x_frame_options = 'DENY'
        config.x_content_type_options = 'nosniff'
        config.x_xss_protection = '1; mode=block'
        config.x_download_options = 'noopen'
        config.x_permitted_cross_domain_policies = 'none'
        config.referrer_policy = %w[origin-when-cross-origin strict-origin-when-cross-origin]
        config.csp = {
            # "meta" values. these will shape the header, but the values are not included in the header.
            preserve_schemes: true, # default: false. Schemes are removed from host sources to save bytes and discourage mixed content.
            disable_nonce_backwards_compatibility: true, # default: false. If false, `unsafe-inline` will be added automatically when using nonces. If true, it won't. See #403 for why you'd want this.
            default_src: OPT_OUT,
            script_src: OPT_OUT,
            img_src: OPT_OUT,
            style_src: OPT_OUT,
            font_src: OPT_OUT,
        }
    end
end
