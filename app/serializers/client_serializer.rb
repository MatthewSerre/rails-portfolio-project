class ClientSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name

  belongs_to :caseload
end
