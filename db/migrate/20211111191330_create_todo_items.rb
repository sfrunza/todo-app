class CreateTodoItems < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_items do |t|
      t.string :title
      t.datetime :due_at
      t.references :todo_date, null: false, foreign_key: true

      t.timestamps
    end
  end
end
