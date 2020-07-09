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

  def friends
    friendships.map { |friendship| friendship.friend if friendship.status == 'Confirmed' } .compact
  end

  def pending_friend(current_user, user)
    if current_user.friendships.where(status: 'Pending').find_by(friend_id: user.id)
      true
    else
      false
    end
  end

  def friend_request(current_user, user)
    if current_user.friendships.where(status: 'Request').find_by(friend_id: user.id)
      true
    else
      false
    end
  end

  def friend?(user)
    confirmed_friendships.any? { |friendship| friendship.friend == user }
  end
end
