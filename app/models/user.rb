# require 'bcrypt'

class User < ApplicationRecord
    has_secure_password

    enum role_id: [:user, :admin ]

    has_many :items
    has_many :shopping_carts
end
