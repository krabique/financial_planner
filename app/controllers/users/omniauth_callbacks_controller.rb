# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google
    handle_oauth
  end

  def github
    handle_oauth
  end

  private

  def user
    @user ||= OauthService.process_user(request.env['omniauth.auth'])
  end

  def handle_oauth
    sign_in_and_redirect user
  rescue ActiveRecord::RecordInvalid
    redirect_when_duplicate_email
  end

  def redirect_when_duplicate_email
    redirect_to new_user_session_path, flash: {
      error: I18n.t('errors.redirect_when_duplicate_email')
    }
  end
end
