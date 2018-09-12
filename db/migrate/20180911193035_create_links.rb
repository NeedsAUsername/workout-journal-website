class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.text :name
      t.text :description
      t.integer :program_plan_id
      t.integer :exercise_id

      t.timestamps
    end
  end
end
