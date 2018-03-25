# frozen_string_literal: true

# This is a service for user's transactions balance
class BalanceService
  def initialize(user)
    @user = user
  end

  def balance
    incomes - expenses
  end

  private

  attr_accessor :user

  def incomes
    sum_query('income')
  end

  def expenses
    sum_query('expense')
  end

  def sum_query(kind)
    Transaction.where(user: user, kind: kind).sum(:amount_cents)
      .to_money / 100
  end
end
