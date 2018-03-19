# frozen_string_literal: true

# Authorizations for categories
class CategoryPolicy < ApplicationPolicy
  # def edit?
  #   belongs_to_user?
  # end

  # def update?
  #   belongs_to_user?
  # end

  # def destroy?
  #   belongs_to_user?
  # end

  # private

  # def belongs_to_user?(parent = scope)
  #   # return true if categorizable == @user
  #   return true if parent.categorizable == current_user
  #   return false if parent.categorizable.is_a?(User)

  #   parent = category.categorizable
  #   # return true if user.present? && user == category.user
  #   return belongs_to_user?(parent)
  # end

  # def category
  #   record
  # end
end
