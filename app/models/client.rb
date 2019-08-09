class Client < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes
    belongs_to :caseload, optional: true
    validates :first_name, presence: true
    validates :last_name, presence: true

    def name
        "#{self.first_name} #{self.last_name}"
    end

    def self.unassigned
        where(caseload_id: nil)
    end
end
