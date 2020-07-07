require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:valid_attributes) {
  #   { :name => "Mickey Mouse", :email => 'mickey@walt-disney.com', :password => "micey" }
  # }

  # let(:valid_session) { {} }

  it 'should create new user' do
    user = create(:user)
    expect(user).to be_present
  end

  it 'should not create new user' do
    create(:user, password: nil)
    raise_error('password cannot be blank')
  end

  context 'validate presence of' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it 'has many posts' do
      assoctiation = described_class.reflect_on_association(:posts)
      expect(assoctiation.macro).to eq :has_many
    end

    it 'has many comments' do
      assoctiation = described_class.reflect_on_association(:comments)
      expect(assoctiation.macro).to eq :has_many
    end

    it 'has many likes' do
      assoctiation = described_class.reflect_on_association(:likes)
      expect(assoctiation.macro).to eq :has_many
    end

    it 'has many friendships' do
      assoctiation = described_class.reflect_on_association(:friendships)
      expect(assoctiation.macro).to eq :has_many
    end
    it 'has many inverse_friendships' do
      assoctiation = described_class.reflect_on_association(:inverse_friendships)
      expect(assoctiation.macro).to eq :has_many
    end
  end
end
