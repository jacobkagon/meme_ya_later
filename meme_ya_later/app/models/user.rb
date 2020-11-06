class User < ApplicationRecord
    has_many :senders, foreign_key: :sender_id , class_name: "Message"
    has_many :receivers, through: :senders
    has_many :receivers, foreign_key: :receiver_id, class_name: "Message"
    has_many :senders, through: :receivers
    has_many :memes
end
