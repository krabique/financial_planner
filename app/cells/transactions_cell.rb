# frozen_string_literal: true

# This cell is used for transactions
class TransactionsCell < ApplicationCell
  def form(controller_name = nil)
    @controller_name = controller_name
    render
  end

  def list(transactions)
    @transactions = transactions
    render
  end

  def item
    render
  end

  def modal
    render
  end

  def search_form(search_query)
    @search_query = search_query
    render
  end
end
