require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_attributes) {
    { :name => "Mickey Mouse", :email => 'mickey@walt-disney.com', :password => "mickey" }
  }

  it "should create new user" do
    User.create! valid_attributes
    expect(User.last).to be_present
  end

  it "should not create new user" do
    User.create(valid_attributes.merge(email: "mkey.com"))
    expect(User.last).to_not be_present
  end

end