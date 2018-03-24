# frozen_string_literal: true

# Authorizations for categories
class CategoryPolicy < ApplicationPolicy
  def edit?
    belongs_to_user?
  end

  def update?
    belongs_to_user?
  end

  def destroy?
    belongs_to_user?
  end

  private

  def belongs_to_user?
    return true if user.present? && user == category.user
  end

  def category
    record
  end
end
