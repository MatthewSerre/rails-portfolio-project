class User < ApplicationRecord
    has_secure_password
    has_many :events
    has_many :attendees, through: :events
end
