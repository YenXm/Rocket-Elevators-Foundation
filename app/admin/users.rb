ActiveAdmin.register User do
    menu parent: "Users +"

    permit_params :first_name,
                  :last_name,
                  :email,
                  :password,
                  :token,
                  :encrypted_password,
                  :reset_password_token,
                  :reset_password_sent_at,
                  :remember_created_at,
                  :function
end
