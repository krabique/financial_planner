# frozen_string_literal: true

# This is a service that handles oauth for users
class OauthService
  def self.process_user(auth)
    new(auth).process_user
  end

  def initialize(auth)
    @auth = auth
    @user = nil
  end

  def process_user
    create_or_update_user
  end

  private

  attr_reader :auth

  def create_or_update_user
    if find_user_by_oauth
      update_user
    elsif find_user_by_email
      # update_if_email_confirmed
      update_user
    else
      create_new_user
    end

    @user
  end

  # def update_if_email_confirmed
  #   if @user.confirmed?
  #     update_user
  #   else
  #     redirect_to root_path, flash: 'abc'
  #   end
  # end

  def update_user
    @user.update!(oauth_user_credentials)
  end

  def find_user_by_oauth
    @user = User.find_by(provider: auth.provider, uid: auth.uid)
  end

  def find_user_by_email
    @user = User.find_by(email: auth.info.email)
  end

  def create_new_user
    new_user_credentials = oauth_user_credentials
    new_user_credentials[:password] = Devise.friendly_token[0, 20]
    @user = User.create!(new_user_credentials)
  end

  def oauth_user_credentials
    auth_personal_info = auth.info

    {
      name: auth_personal_info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth_personal_info.email,
      confirmed_at: Time.current,
      remote_avatar_url: auth_personal_info.image
    }
  end
end
