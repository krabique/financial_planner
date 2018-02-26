# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable,
         omniauth_providers: [:google_oauth2]

  validates :name, presence: true

  def self.oauth_user_credentials(auth)
    {
      name: auth.info['name'],
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0,20],
      confirmed_at: Time.current
    }
  end

  def self.from_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid)
      .first_or_create(oauth_user_credentials(auth))
    user.update!(oauth_user_credentials(auth))
    user
  end
end
