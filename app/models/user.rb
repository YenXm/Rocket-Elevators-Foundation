# frozen_string_literal: true

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors.add attribute, (options[:message] || 'is not an email')
    end
  end
end

class User < ApplicationRecord
  include ActiveModel::Validations
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :registerable,
         #    :password_expirable,
         :secure_validatable

  validates :email, presence: true, email: true

  has_many :employees, dependent: :destroy
  has_one :customer, dependent: :destroy

  # class_name: "employee", foreign_key: "employees_id" i did remove this one it works with it though

  def to_s
    self.first_name + ' ' + self.last_name
  end
end
