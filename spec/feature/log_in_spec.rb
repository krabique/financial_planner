# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SignUpsAndLogIns', type: :feature do
  let(:name) { Faker::DrWho.character }
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  it 'lets a visitor log in' do
    user = User.create(name: name, email: email, password: password)
    user.update(confirmed_at: Time.current)

    visit '/users/sign_in'

    within('#new_user') do
      fill_in 'user_email', with: email
      fill_in 'user_password', with: password
    end

    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end
end
