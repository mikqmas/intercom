class Employee < ApplicationRecord
  has_many :employee_groups, dependent: :destroy
  has_many :groups, through: :employee_groups
end
