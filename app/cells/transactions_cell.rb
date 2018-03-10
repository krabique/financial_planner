# frozen_string_literal: true

# This cell is used for transactions
class TransactionsCell < ApplicationCell
  def form
    render
  end

  def list(transactions)
    @transactions = transactions
    render
  end

  def item
    render
  end
end
