# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    handle_oauth
  end

  def github
    handle_oauth
  end

  private

  def handle_oauth
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in_and_redirect @user
  rescue ActiveRecord::RecordInvalid
    redirect_when_duplicate_email
  end

  def redirect_when_duplicate_email
    redirect_to new_user_session_path, flash: {
      error: I18n.t('errors.redirect_when_duplicate_email')
    }
  end
end
