# frozen_string_literal: true

class Employee < ApplicationRecord
    belongs_to :user
    has_many :batteries, dependent: :destroy
    has_many :interventions, dependent: :destroy
    has_many :authors, class_name: 'Intervention'

    def to_s
        'Employee #' + self.id.to_s
    end
end
