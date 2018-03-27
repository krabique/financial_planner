# frozen_string_literal: true

# Authorizations for transactions
class TransactionPolicy < ApplicationPolicy
  def update?
    record_belongs_to_user?
  end

  def destroy?
    record_belongs_to_user?
  end
end
