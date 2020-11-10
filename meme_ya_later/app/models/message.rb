class Message < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    belongs_to :sender, class_name: "User", foreign_key: 'sender_id'
    belongs_to :receiver, class_name: "User", foreign_key: 'receiver_id'
    scope :unread, -> { where read: false }
    
    validates :body, presence: true, length: { maximum: 500 }
    validates :sender, presence: true
    validates :receiver, presence: true
end
