class CreateTodoDates < ActiveRecord::Migration[6.1]
  def change
    create_table :todo_dates do |t|
      t.date :day

      t.timestamps
    end
  end
end
