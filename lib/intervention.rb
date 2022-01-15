module Intervention
  class CreateFakeData
    def initialize; end

    def raise_error(data)
      if [nil, 0, ''].any? { |employee| employee == data['employee_id'] }
        raise CannotBeNullError.new($!),
              "data['employee_id'] expected to be an integer > 0 but was '#{data['employee_id']}'"
      end
      if [nil, 0, ''].any? { |building| building == data['building_id'] }
        raise CannotBeNullError.new($!),
              "data['building_id'] expected to be an integer > 0 but was '#{data['building_id']}'"
      end
      if [nil, 0, ''].any? { |intervention| intervention == data['intervention_start'] }
        raise CannotBeNullError.new($!),
              "data['intervention_start'] expected to be a timestamp but was '#{data['intervention_start']}'"
      end
      if %w[Success Fail Incomplete].none? { |result| result == data['result'] }
        raise WrongStatusError.new($!),
              "data['result'] expected to be something between Success, Fail, Incomplete but was '#{data['result']}'"
      end
      if %w[Pending InProgress Interrupted Resumed Complete].none? { |status| status == data['status'] }
        raise WrongStatusError.new($!),
              "data['status'] expected to be something between Pending, InProgress, Interrupted, Resumed, Complete but was '#{data['status']}'"
      end
    end

    def insert(data)
      raise_error(data)

      string1 = 'INSERT INTO fact_interventions(employee_id, building_id,'

      if data['battery_id'] != nil
        string1 << 'battery_id,'

        if data['column_id'] != nil
          string1 << 'column_id,'

          string1 << 'elevator_id,' if data['elevator_id'] != nil
        end
      end
      string1 << 'intervention_start,'

      string1 << 'intervention_end,' if data['intervention_end'] != nil

      string1 << 'result,'

      string1 << 'report,' if data['report'] != nil

      string1 << 'status)'

      string2 = "VALUES('#{data['employee_id']}', '#{data['building_id']}',"

      if data['battery_id'] != nil
        string2 << "'#{data['battery_id']}',"

        if data['column_id'] != nil
          string2 << "'#{data['column_id']}',"

          string2 << "'#{data['elevator_id']}'," if data['elevator_id'] != nil
        end
      end
      string2 << "'#{data['intervention_start']}',"

      string2 << "'#{data['intervention_end']}'," if data['intervention_end'] != nil

      string2 << "'#{data['result']}',"

      string2 << "'#{data['report']}'," if data['report'] != nil

      string2 << "'#{data['status']}')"

      PgConnection::MyConnection.execute(string1 + string2)
    end

    def create(params, employee_id, building_id, battery_id: nil, column_id: nil, elevator_id: nil)
      data = {
        'employee_id' => employee_id,
        'building_id' => building_id,
        'battery_id' => battery_id,
        'column_id' => column_id,
        'elevator_id' => elevator_id,
        'intervention_start' => params['intervention_start'],
        'intervention_end' => params['intervention_end'],
        'result' => params['result'],
        'report' => params['report'],
        'status' => params['status']
      }
      insert(data)
    end
  end

  Base = CreateFakeData.new
end
