ActiveAdmin.register Customer do
    menu parent: "Users +"

    permit_params :user_id,
                  :customer_creation_date,
                  :company_name,
                  :company_headquarters_address,
                  :full_name_of_the_company_contact,
                  :company_contact_phone,
                  :email_of_the_company_contact,
                  :company_description,
                  :technical_authority_phone_for_service,
                  :technical_manager_email_for_service,
                  :address_id,
                  :full_name_of_service_technical_authority
end
