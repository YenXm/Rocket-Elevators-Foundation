class Intervention < ApplicationRecord
    #TODO remove wrong optional options
    belongs_to :employee, optional: true
    belongs_to :customer, optional: true
    belongs_to :building, optional: true
    belongs_to :battery, optional: true
    belongs_to :column, optional: true
    belongs_to :elevator, optional: true
end
