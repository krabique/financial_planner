# frozen_string_literal: true

# This is a service for user's transactions balance
class BalanceService
  def initialize(user)
    @user = user
  end

  def balance
    incomes - expenses
  end

  def open_money
    incomes - transfers_to_category
  end

  private

  attr_accessor :user

  def transfers_to_category
    user.transactions.where(kind: 'open_transfer').where.not(category_id: nil)
      .sum(:amount_cents).to_money / 100
  end

  def incomes
    sum_query('income')
  end

  def expenses
    sum_query('expense')
  end

  def sum_query(kind)
    user.transactions.where(kind: kind).sum(:amount_cents).to_money / 100
  end
end
