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
            # Author_id Will be hidden at all time with css
            input :author_id, as: :select, collection: [current_user.employees.first], include_blank: false
            input :customer_id,
                  as: :select,
                  prompt: 'Select customer',
                  collection: Customer.all,
                  input_html: {
                      onchange: 'cascade("customer","building"); collection("customer", "building")',
                  }

            # building_id, battery_id, column_id, elevator_id will be initially hidden
            # Selection option will be added as each field becomes displayed
            input :building_id,
                  as: :select,
                  input_html: {
                      onchange: 'collection("building", "battery"); cascade("building","battery")',
                  }
            input :battery_id,
                  as: :select,
                  input_html: {
                      onchange: 'cascade("battery","column"); collection("battery", "column")',
                  }
            input :column_id,
                  as: :select,
                  input_html: {
                      onchange: 'cascade("column","elevator"); collection("column", "elevator")',
                  }

            input :elevator_id, as: :select
        end
        inputs do
            input :employee_id, as: :select, collection: Employee.all, prompt: 'Null', required: false
            input :report, label: 'Description', required: true
        end

        f.actions # adds the 'Submit' and 'Cancel' buttons
    end

    controller do
        # Modify the create method that come with inherited_resources gem
        # POST /resources
        def create(options = {}, &block)
            object = build_resource

            options[:location] ||= smart_resource_url if create_resource(object)

            respond_with_dual_blocks(object, options, &block)

            ZendeskAPI::Ticket.create!(
                @client,
                subject: 'New Intervention',
                requester: {
                    'name': object.author.email,
                },
                description: object.report,
                # Make sure the you select the good form in zendesk to see these field
                custom_fields: [
                    { id: 360_049_401_091, value: object.customer },
                    { id: 1_900_003_022_547, value: object.building_id },
                    { id: 360_049_401_211, value: object.battery_id },
                    { id: 360_049_337_492, value: object.column_id || '' },
                    { id: 1_900_003_022_487, value: object.elevator_id || '' },
                    { id: 360_049_401_231, value: object.employee },
                ],
                type: :incident,
                priority: :normal,
            )
        end
        alias create! create
    end
end
