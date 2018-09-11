class CreateProgramPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :program_plans do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.boolean :featured

      t.timestamps
    end
  end
end
