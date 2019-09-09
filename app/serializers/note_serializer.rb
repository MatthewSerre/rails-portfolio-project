class NoteSerializer < ActiveModel::Serializer
  attributes :date, :length_in_minutes, :content, :created_at, :updated_at
end
