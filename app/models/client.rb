class Client < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes
    belongs_to :caseload

    def name
        "#{self.first_name} #{self.last_name}"
    end
end
