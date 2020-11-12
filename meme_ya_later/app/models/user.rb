class User < ApplicationRecord
    validates :name, :username, :password, presence: true
    EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email_address, presence: true, format: { with: EMAIL_FORMAT }, 
    uniqueness: true

    
    before_save { self.email = email_address.downcase }
    
    
    
    has_many :sent_messages, class_name: "Message", foreign_key: :sender_id 
    has_many :receivers, through: :sent_messages, source: :receiver
    has_many :received_messages, class_name: "Message", foreign_key: :receiver_id 
    has_many :senders, through: :received_messages, source: :sender
    has_many :memes

    has_secure_password
end
