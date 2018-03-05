# frozen_string_literal: true

require 'rails_helper'
require_relative '../support/oauth_spec_support'

RSpec.describe 'SignUpWithGoogle', type: :feature do
  oauth_spec_support = OauthSpecSupport.new('google')
  before { oauth_spec_support.stub_omniauth }

  it 'lets a visitor sign up' do
    expect do
      visit '/'

      find('a[href*="/users/auth/google"]').click
    end.to change(User, :count).by(1)
  end
end
