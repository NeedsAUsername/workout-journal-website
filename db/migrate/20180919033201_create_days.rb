class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.string :name
      t.integer :program_plan_id

      t.timestamps
    end
  end
end
