class EmployeesGroup < ApplicationRecord
    belongs_to :employee
    belongs_to :group
end
