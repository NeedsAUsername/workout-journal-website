class ExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :sets, :reps
end
