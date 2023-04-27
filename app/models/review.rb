# Specifying the relationship between review, users and movie. 
class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :movie
end
