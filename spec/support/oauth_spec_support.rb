# frozen_string_literal: true

# This class is used for stubbing oauth logic
class OauthSpecSupport
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[provider.to_sym] =
      OmniAuth::AuthHash.new(user_auth_data)
  end

  def initialize(provider)
    @provider = provider
  end

  private

  attr_accessor :provider

  def user_auth_data
    {
      provider: provider,
      uid: Faker::Number.number(10),
      info: user_personal_info,
      credentials: user_credentials
    }
  end

  def user_personal_info
    {
      email: Faker::Internet.email,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    }
  end

  def user_credentials
    {
      token: Faker::Number.number(10),
      refresh_token: Faker::Number.number(10),
      expires_at: Time.current
    }
  end
end
