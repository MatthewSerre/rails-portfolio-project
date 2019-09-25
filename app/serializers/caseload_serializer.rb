# /app/serializers/caseload_serializer.rb

class CaseloadSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :user
  has_many :clients
end
