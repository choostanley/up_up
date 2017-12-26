class User < ApplicationRecord
	enum access_level: [:user, :admin]
	has_secure_password
	has_many :items
end
