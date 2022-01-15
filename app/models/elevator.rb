class Elevator < ApplicationRecord
  belongs_to :column
  has_many :interventions, dependent: :destroy

  def to_s
    'Elevator #' + self.id.to_s
  end
end
