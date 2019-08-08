class User < ApplicationRecord
    has_secure_password
    has_many :notes
    has_many :clients, through: :notes

    def name
        "#{self.first_name} #{self.last_name}"
    end

    def self.find_or_create_from_auth_hash(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
            user.email = auth.info.email
            user.password = SecureRandom.urlsafe_base64
			user.save!
		end
    end
end
