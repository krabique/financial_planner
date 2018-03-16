# frozen_string_literal: true

# This is a service for user's transactions balance
class BalanceService
  def initialize(user)
    @user = user
  end

  def balance
    Transaction.where(user: user).sum(:amount_cents)
      .to_money / 100
  end

  private

  attr_accessor :user
end
