# frozen_string_literal: true

# This is a service for user's transactions balance
class CreateCategotyService
  def initialize(parent:, params:)
    @parent = parent
    @params = params
  end

  def call
    parent.categories.create!(params)
  end

  private

  attr_accessor :parent, :params
end
