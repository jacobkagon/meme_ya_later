class Message < ApplicationRecord


    belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
    belongs_to :receiver, class_name: "User", foreign_key: 'receiver_id'
  
    
    validates :body, presence: true, length: { maximum: 500 }
    validates :sender, presence: true
    validates :receiver, presence: true
end
