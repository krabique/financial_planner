# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :authorize_account_edit, only: %i[edit update]

  DEFAULT_CATEGORIES = %w[Transportation Food House Entertainment Health Other].freeze

  def create
    super
    DEFAULT_CATEGORIES.each do |category|
      resource.sub_categories.create(name: category, user: resource)
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys:
      %i[name avatar avatar_cache remove_avatar])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys:
      %i[name avatar avatar_cache remove_avatar])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def oauth_provider_humanized
    case provider
    when 'google' then 'Google'
    when 'github' then 'GitHub'
    end
  end

  delegate :provider, to: :current_user

  def authorize_account_edit
    reject_oauth_editing if provider
  end

  def reject_oauth_editing
    redirect_to root_path, flash: {
      error: I18n.t('errors.edit_oauth_profile', provider:
        oauth_provider_humanized)
    }
  end
end
