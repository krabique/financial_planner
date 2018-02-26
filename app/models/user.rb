# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable,
         omniauth_providers: %i[google_oauth2 github]

  validates :name, presence: true

  def self.oauth_user_credentials(auth)
    {
      name: auth.info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20],
      confirmed_at: Time.current
    }
  end

  def self.from_omniauth(auth)
    user_credentials = oauth_user_credentials(auth)
    user = where(provider: auth.provider, uid: auth.uid)
           .first_or_create(user_credentials)
    user.update!(user_credentials)
    user
  end
end
