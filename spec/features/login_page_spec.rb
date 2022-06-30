require 'rails_helper'

RSpec.describe 'Login page', type: :feature do
  before :all do
    @first_user ||= User.create(
      name: 'Umair',
      email: 'umair@test.com',
      password: 'test1234'
    )
  end

  before :each do
    visit new_user_session_path
  end

  after :all do
    @first_user.destroy
  end

  it 'See email input' do
    expect(has_field?('user_email')).to be true
  end

  it 'See password input' do
    expect(has_field?('user_password')).to be true
  end

  it 'See Log in button' do
    expect(has_button?('Log in')).to be true
  end

  it 'Detail error with empty credentials' do
    fill_in 'user_email', with: ''
    fill_in 'user_password', with: ''
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end

  it 'Detail error with wrong credentials' do
    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password.'
  end
end
