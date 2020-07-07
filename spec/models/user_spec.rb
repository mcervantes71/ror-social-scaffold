require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:valid_attributes) {
  #   { :name => "Mickey Mouse", :email => 'mickey@walt-disney.com', :password => "micey" }
  # }

  # let(:valid_session) { {} }

  it "should create new user" do
    # User.create! valid_attributes
    user = create(:user)
    expect(user).to be_present
  end

  it "should not create new user" do
    user = create(:user, password: nil)
    raise_error('password cannot be blank')
  end

  it 'create new user' do
    friend = create(:friend)
    expect(friend).to be_present
  end


end