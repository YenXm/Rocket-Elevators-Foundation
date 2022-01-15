ActiveAdmin.register Column do
  menu parent: 'Building Parts'

  permit_params :column_type, :number_of_floors_served, :status, :information, :notes, :battery_id
end
