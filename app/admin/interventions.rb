ActiveAdmin.register Intervention do
    # See permitted parameters documentation:
    # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
    #
    # Uncomment all parameters which should be permitted for assignment
    #
    permit_params :author_id,
                  :customer_id,
                  :building_id,
                  :employee_id,
                  :battery_id,
                  :column_id,
                  :elevator_id,
                  :started_at,
                  :ended_at,
                  :result,
                  :report,
                  :status

    form do |f|
        f.semantic_errors # shows errors on :base
        inputs do
            input :author_id,
                  as: :select,
                  collection: [current_user.employees.first],
                  include_blank: false
            input :customer_id,
                  as: :select,
                  prompt: 'Select customer',
                  collection: Customer.all,
                  input_html: {
                      onchange:
                          'cascade("customer","building"); collection("customer", "building")',
                  }
            input :building_id,
                  as: :select,
                  input_html: {
                      onchange:
                          'collection("building", "battery"); cascade("building","battery")',
                  }
            input :battery_id,
                  as: :select,
                  input_html: {
                      onchange:
                          'cascade("battery","column"); collection("battery", "column")',
                  }
            input :column_id,
                  as: :select,
                  input_html: {
                      onchange:
                          'cascade("column","elevator"); collection("column", "elevator")',
                  }

            input :elevator_id, as: :select
        end
        inputs do
            input :employee_id, as: :select, collection: Employee.all
            input :report, label: 'Description'
        end

        f.actions # adds the 'Submit' and 'Cancel' buttons
    end
end
