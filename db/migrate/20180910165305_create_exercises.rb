class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :description
      t.integer :weight
      t.integer :sets
      t.integer :reps

      t.timestamps
    end
  end
end
