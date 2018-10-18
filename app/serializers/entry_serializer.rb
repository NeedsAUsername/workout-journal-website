class EntrySerializer < ActiveModel::Serializer
  attributes :id, :date, :comments
  has_many :exercises

end
