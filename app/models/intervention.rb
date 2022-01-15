class Intervention < ApplicationRecord
  #TODO remove wrong optional options
  belongs_to :employee, optional: true
  belongs_to :customer
  belongs_to :building
  belongs_to :battery
  belongs_to :column, optional: true
  belongs_to :elevator, optional: true
  belongs_to :author, class_name: 'Employee'

  validates_presence_of :customer_id
  validates_presence_of :building_id
end
