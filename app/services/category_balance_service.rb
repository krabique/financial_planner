# frozen_string_literal: true

# This is a service for category's transactions balance
class CategoryBalanceService
  def initialize(category)
    @category = category
  end

  def call
    incomes - expenses
  end

  private

  attr_accessor :category

  def incomes
    sum_query('open_transfer')
  end

  def expenses
    sum_query('expense')
  end

  def sum_query(kind)
    category.transactions.where(kind: kind).sum(:amount_cents).to_money / 100
  end
end
