class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  has_many :confirmed_friendships, -> { where status: 'Confirmed' }, class_name: 'Friendship'
  has_many :friends, through: :confirmed_friendships

  has_many :pending_friendships, -> { where status: 'Pending' }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :pending_friends, through: :pending_friendships, source: :friend

  has_many :request_friendships, -> { where status: 'Request' }, class_name: 'Friendship', foreign_key: 'user_id'
  has_many :friend_requests, through: :request_friendships

  def friends
    friendships.map { |friendship| friendship.friend if friendship.status == 'Confirmed' }.compact
  end

  def pending_friend?(user)
    pending_friendships.any? { |friendship| friendship.friend == user }
  end

  def friend_request?(user)
    request_friendships.any? { |friendship| friendship.friend == user }
  end

  def friend?(user)
    confirmed_friendships.any? { |friendship| friendship.friend == user }
  end
end
