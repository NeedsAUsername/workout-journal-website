class JournalSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :entries

  class EntrySerializer < ActiveModel::Serializer
    attributes :date, :comments
    has_many :exercises

    class ExerciseSerializer < ActiveModel::Serializer
      attributes :name, :weight, :sets, :reps
    end
  end
end
