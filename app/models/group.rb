class Group < ApplicationRecord
  belongs_to :merchant
  has_many :messages, dependent: :destroy
  has_many :employee_groups, dependent: :destroy
  has_many :employees, through: :employee_groups
end
