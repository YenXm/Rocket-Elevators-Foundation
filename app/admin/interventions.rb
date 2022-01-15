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
      input :author_id, as: :select, collection: [current_user.employees.first], include_blank: false
      input :customer_id,
            as: :select,
            prompt: 'Select customer',
            collection: Customer.all,
            input_html: {
              onchange: 'cascade("customer","building"); collection("customer", "building")'
            }
      if f.object.new_record?
        input :building_id,
              as: :select,
              collection: Building.all,
              input_html: {
                onchange: 'collection("building", "battery"); cascade("building","battery")',
                class: 'new_record'
              }
        input :battery_id,
              as: :select,
              collection: Battery.all,
              input_html: {
                onchange: 'cascade("battery","column"); collection("battery", "column")',
                class: 'new_record'
              }
        input :column_id,
              as: :select,
              collection: Column.all,
              input_html: {
                onchange: 'cascade("column","elevator"); collection("column", "elevator")',
                class: 'new_record'
              }

        input :elevator_id, as: :select, collection: Elevator.all, input_html: { class: 'new_record' }
      else
        input :building_id,
              as: :select,
              collection: Customer.find(f.object.customer_id).buildings,
              input_html: {
                onchange: 'collection("building", "battery"); cascade("building","battery")'
              }
        input :battery_id,
              as: :select,
              collection: Building.find(f.object.building_id).batteries,
              input_html: {
                onchange: 'cascade("battery","column"); collection("battery", "column")'
              }
        if f.object.battery_id.nil?
          input :column_id,
                as: :select,
                input_html: {
                  onchange: 'cascade("column","elevator"); collection("column", "elevator")',
                  class: 'new_record'
                }
        else
          input :column_id,
                as: :select,
                collection: Battery.find(f.object.battery_id).columns,
                prompt: 'None',
                input_html: {
                  onchange: 'cascade("column","elevator"); collection("column", "elevator")',
                  class: 'add_none1'
                }
        end

        if f.object.column_id.nil?
          input :elevator_id, as: :select, input_html: { class: 'new_record' }
        else
          input :elevator_id,
                as: :select,
                collection: Column.find(f.object.column_id).elevators,
                prompt: 'None',
                input_html: {
                  class: 'add_none2'
                }
        end
      end
    end
    inputs do
      input :employee_id, as: :select, collection: Employee.all, prompt: 'None'
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
          'name': object.author.email
        },
        description: object.report,
        # Make sure the you select the good form in zendesk to see these field
        custom_fields: [
          { id: 1_900_005_996_565, value: object.customer },
          { id: 1_500_013_299_021, value: object.building_id },
          { id: 1_900_005_996_625, value: object.battery_id },
          { id: 1_900_005_996_665, value: object.column_id || '' },
          { id: 1_500_013_381_822, value: object.elevator_id || '' },
          { id: 1_500_013_381_842, value: object.employee }
        ],
        type: :incident,
        priority: :normal
      )
    end
    alias create! create
  end
end
