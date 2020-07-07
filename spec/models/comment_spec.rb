require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:invalid_comment) { FactoryBot.build(:comment, :invalid_comment) }

  describe 'validations for comment model' do
    it 'is not valid if the comment exceeds limit ' do
      should_not allow_value('this is a very long tape' * 20).for(:content)
    end

    it 'is not valid without a post' do
      should_not allow_value(invalid_comment.post).for(:post)
    end
  end

  describe 'associations' do
    it 'belongs to user' do
      should belong_to(:user)
    end

    it 'belongs to post' do
      should belong_to(:post)
    end
  end
end
