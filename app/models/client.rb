class Client < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes

    def name
        "#{self.first_name} #{self.last_name}"
    end
end
