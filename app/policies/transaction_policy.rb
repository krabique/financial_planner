# frozen_string_literal: true

# Authorizations for transactions
class TransactionPolicy < ApplicationPolicy
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
    return true if user.present? && user == transaction.user
  end

  def transaction
    record
  end
end
