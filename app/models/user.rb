class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  def friends
    friendships.map { |friendship| friendship.friend if friendship.confirmed } .compact
  end

  def inverse_friends
    inverse_friendships.map { |friendship| friendship.user if friendship.confirmed } .compact
  end

  # Users who have yet to confirme friend requests
  def pending_friend(user)
    inverse_friendships.map { |friendship| friendship.user.id if friendship.user_id == user.id && !friendship.confirmed } .compact
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend if !friendship.confirmed } .compact
  end

  # Users who have requested to be friends
  def friend_request(user)
    friendships.map { |friendship| friendship.friend.id if friendship.friend_id == user.id && !friendship.confirmed } .compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user if !friendship.confirmed } .compact
  end

  def friend?(user)
    friends.include?(user)
  end

  def inverse_friend?(user)
    inverse_friends.include?(user)
  end
end
