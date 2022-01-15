class Battery < ApplicationRecord
  belongs_to :building
  belongs_to :employee
  has_many :columns, dependent: :destroy
  has_many :interventions, dependent: :destroy

  def to_s
    'Battery #' + self.id.to_s
  end
end
