# frozen_string_literal: true

# This is a service that handles oauth for users
class OauthService
  def initialize(auth)
    @auth = auth
  end

  def process_user
    create_or_update_user
  end

  private

  attr_accessor :auth

  def user_credentials
    @user_credentials ||= oauth_user_credentials
  end

  def create_or_update_user
    user = User.where(provider: auth.provider, uid: auth.uid)
               .first_or_create(user_credentials)
    user.update!(user_credentials)
    user
  end

  def oauth_user_credentials
    auth_personal_info = auth.info

    {
      name: auth_personal_info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth_personal_info.email,
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.current,
      remote_avatar_url: auth_personal_info.image
    }
  end
end
