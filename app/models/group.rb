class Group < ApplicationRecord
  has_many :employees_groups, dependent: :destroy
  has_many :employees, through: :employees_groups
  has_many :users, through: :user_todos
end
