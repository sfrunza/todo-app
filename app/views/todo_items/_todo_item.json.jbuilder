json.extract! todo_item, :id, :title, :due_at, :todo_date_id, :created_at, :updated_at
json.url todo_item_url(todo_item, format: :json)
