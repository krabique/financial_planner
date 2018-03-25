# frozen_string_literal: true

# This is a service for user's transactions balance
class CreateStandardCategoriesService
  DEFAULT_CATEGORIES =
    %w[Transportation Food House Entertainment Health Other].freeze

  def initialize(user:)
    @user = user
  end

  def call
    DEFAULT_CATEGORIES.each do |category|
      user.sub_categories.create(name: category, user: user)
    end
  end

  private

  attr_accessor :user
end
