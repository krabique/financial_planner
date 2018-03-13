# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(_resource)
    request.env['omniauth.origin'] || root_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to(request.referer || root_path)
  end
end
