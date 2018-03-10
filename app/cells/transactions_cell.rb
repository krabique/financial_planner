# frozen_string_literal: true

# This cell is used for transactions
class TransactionsCell < ApplicationCell
  def new(transaction)
    @transaction = transaction
    render
  end

  def last(quantity)
    @transactions = current_user.transactions.order(id: :desc).limit(quantity)
    @quantity = quantity
    render
  end
end
