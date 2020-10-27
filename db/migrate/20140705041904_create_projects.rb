class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :start_at
      t.date :end_at
      t.integer :expected_progress
      t.integer :current_progress

      t.timestamps
    end
  end
end
