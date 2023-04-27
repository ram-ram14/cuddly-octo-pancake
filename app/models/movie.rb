# Specifying the associations between movie and reviews. 
class Movie < ApplicationRecord
    has_many :reviews, dependent: :destroy
end
