# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def after_sign_in_path_for(_resource)
    request.env['omniauth.origin'] || root_path
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
