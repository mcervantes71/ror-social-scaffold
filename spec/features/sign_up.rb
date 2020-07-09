require 'rails_helper'

RSpec.describe 'Sign up', type: :feature do
  let(:user) { create(:user) }

  scenario 'Sign up successfully' do
    # user = create(:user)
    visit root_url
    click_on 'Sign up'
    visit '/users/sign_up'
    within('form') do
      fill_in 'Name', with: user.name
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
    end
    click_on 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
