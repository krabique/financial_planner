# frozen_string_literal: true

# This cell is used for transactions
class TransactionsCell < ApplicationCell
  def form(controller_name = nil)
    @controller_name = controller_name

    case model.kind
    when 'income'
      income_form
    when 'open_transfer'
      open_transfer_form
    when 'category_transfer'
      category_transfer_form
    when 'expense'
      expense_form
    else
      render
    end
  end

  def income_form
    render
  end

  def open_transfer_form
    render
  end

  def category_transfer_form
    render
  end

  def expense_form
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
