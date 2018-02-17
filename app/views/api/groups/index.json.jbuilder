# json.array! @todos, partial: 'api/todos/todos', as: :todo
json.partial! 'api/groups/groups', collection: @groups, as: :group
