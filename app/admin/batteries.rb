ActiveAdmin.register Battery do
    permit_params :building_id,
                  :battery_type,
                  :status,
                  :employee_id,
                  :Date_of_,
                  :date_of_last_inspection,
                  :certificate_of_operations,
                  :information,
                  :notes,
                  :date_of_commissioning
end
