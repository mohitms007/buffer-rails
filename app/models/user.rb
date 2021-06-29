#email: String
#password_digest: string
#password: string virtual
#passwrod_confirmation: string virtual

class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, format: {with: /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i , message: "must be a valid email address"}
end
