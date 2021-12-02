ActiveAdmin.register Building do
    permit_params :customer_id,
                  :full_name_of_the_building_administrator,
                  :email_of_the_administrator_of_the_building,
                  :full_name_of_the_technical_contact_for_the_building,
                  :technical_contact_phone_for_the_building,
                  :address_id,
                  :phone_number_of_the_building_administrator,
                  :technical_contact_email_for_the_building
end
