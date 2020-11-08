class Meme < ApplicationRecord
    belongs_to :user
    belongs_to :category, required: false
    validates :url, presence: true
end
