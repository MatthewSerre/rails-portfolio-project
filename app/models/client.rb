class Client < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes
    belongs_to :caseload, optional: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    scope :unassigned, -> { where(caseload_id: nil) }

    def name
        "#{self.first_name} #{self.last_name}"
    end
end
