class Meme < ApplicationRecord
    belongs_to :user
    belongs_to :category, required: false
    has_one_attached :file
    validates :url, presence: true
end
