ActiveAdmin.register Address do
    permit_params :type_of_address,
                  :status,
                  :entity,
                  :number_and_street,
                  :suite_or_apartment,
                  :city,
                  :postal_code,
                  :country,
                  :notes
end
