class Client < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes
    belongs_to :caseload, optional: true

    def name
        "#{self.first_name} #{self.last_name}"
    end

    def self.unassigned
        Client.where("caseload_id = 0")
    end
end
