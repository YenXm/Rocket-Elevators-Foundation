ActiveAdmin.register_page 'Exchange rate' do
    menu parent: "API +"
    controller do
        def get_exchange_rates
            require 'uri'
            require 'net/http'
            require 'openssl'

            fromCurrency = Currency.find(params[:fromCurrency]).currency_ID
            toCurrency = Currency.find(params[:toCurrency]).currency_ID


            url =
                URI(
                    "https://investing-cryptocurrency-markets.p.rapidapi.com/currencies/get-rate?fromCurrency=#{fromCurrency}&toCurrency=#{toCurrency}&lang_ID=1&time_utc_offset=28800",
                )

            http = Net::HTTP.new(url.host, url.port)
            http.use_ssl = true
            http.verify_mode = OpenSSL::SSL::VERIFY_NONE

            request = Net::HTTP::Get.new(url)
            request['x-rapidapi-host'] = ENV['X-RAPIDAPI-HOST']
            request['x-rapidapi-key'] = ENV['X-RAPIDAPI-KEY']

            response = http.request(request)
            render json: response.body
        end

        def symbol
            symbol = Currency.find(params[:id]).currency_symbol
            render json: { 'symbol': symbol }
        end
    end

    content do
        render 'form'

        h1 'Result:', id: 'result'
    end
end
