class CreateExerciseProgramPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_program_plans do |t|
      t.integer :exercise_id
      t.integer :program_plan_id
      
      t.timestamps
    end
  end
end
