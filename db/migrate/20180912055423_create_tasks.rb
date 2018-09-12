class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :description, null: false
      t.string :status, null: false

      t.timestamps
    end
    add_index :tasks, :status
  end
end
