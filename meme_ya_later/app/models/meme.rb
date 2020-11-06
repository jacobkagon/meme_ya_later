class Meme < ApplicationRecord
    belongs_to :user
    belongs_to :category, required: false
end
