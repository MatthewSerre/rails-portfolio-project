class User < ApplicationRecord
    has_secure_password
    has_many :notes
    has_many :clients, through: :notes
    has_one :caseload

    before_save { self.email = email.downcase }
    validates :first_name, presence: true
    validates :last_name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 6 }

    def name
        "#{self.first_name} #{self.last_name}"
    end

    def clients
        self.notes.map do |note|
            note.client
        end
    end

    def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
            user.email = auth.info.email
            user.password = SecureRandom.urlsafe_base64
			user.save
		end
    end
end
