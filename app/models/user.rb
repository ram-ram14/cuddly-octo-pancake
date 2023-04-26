class User < ApplicationRecord
    has_secure_password
    validates :email, :uniqueness => true, :presence => true
    has_many :reviews, dependent: :destroy
    has_many :movies, through: :reviews
end
