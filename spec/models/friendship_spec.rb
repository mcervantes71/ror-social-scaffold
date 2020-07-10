require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:valid_friendship) { FactoryBot.build(:friendship, :confirmed) }
  let(:requested_friendship) { FactoryBot.build(:friendship, :requested) }
  let(:pending_friendship) { FactoryBot.build(:friendship, :pending) }

  describe 'associations' do
    it 'belongs to User' do
      should belong_to(:user)
    end

    it 'belongs to Friend' do
      should belong_to(:friend)
    end
  end

  describe 'testing methods' do
    it 'should return confirmed if friendship is confirmed' do
      should allow_value(valid_friendship.status).for(:status)
    end

    it 'should return pending if friendship confirmed is pending' do
      should allow_value(pending_friendship.status).for(:status)
    end

    it 'should return requested if friendship is requested' do
      should allow_value(requested_friendship.status).for(:status)
    end
  end

  describe 'validations' do
    it 'is has a valid user_id' do
      should allow_value(valid_friendship.user_id).for(:user_id)
    end

    it 'is has a valid friend_id' do
      should allow_value(valid_friendship.friend_id).for(:friend_id)
    end
  end
end
