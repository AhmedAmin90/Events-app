class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships
  has_many :friends , class_name: 'Friendship' , foreign_key: "friend_id"
  has_many :confirmed_friends, -> { where status: true }, class_name: 'Friendship'
  has_many :pending_friends, -> { where status: nil }, class_name: 'Friendship'

  
  has_many :posts

  has_many :events
  has_many :events_users


  has_many :comments
  has_many :likes
end
