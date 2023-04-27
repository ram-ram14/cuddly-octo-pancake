class User < ApplicationRecord
    # The password attribute is encrypted
    has_secure_password
    # validates that the email attribute is unique. 
    validates :email, :uniqueness => true, :presence => true
    # specifying the association between user, reviews and movies.
    has_many :reviews, dependent: :destroy
    has_many :movies, through: :reviews
end
