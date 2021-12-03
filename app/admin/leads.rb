ActiveAdmin.register Lead do


    permit_params :full_name,
                  :company_name,
                  :email,
                  :phone,
                  :project_name,
                  :project_description,
                  :department_in_charge_of_the_elevators,
                  :message,
                  :contact_attachment_file,
                  :contact_date,
                  :date_of_creation
end
