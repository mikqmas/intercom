json.(@group, :id, :name, :description, :created_at, :updated_at)

json.employees @group.employees do |employee|
  json.uuid employee.uuid
  json.name employee.name
  json.role employee.role
  json.isOwner employee.isOwner
end
