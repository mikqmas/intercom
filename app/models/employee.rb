class Employee < ApplicationRecord
  has_many :employees_groups, dependent: :destroy
  has_many :groups, through: :employees_groups
  has_many :messages, dependent: :destroy
end
