# frozen_string_literal: true

# This cell is used for categories
class CategoriesCell < ApplicationCell
  def form
    render
  end

  def list(categories)
    @categories = categories
    render
  end

  def item
    @balance = CategoryBalanceService.new(model).call
    render
  end

  def modal
    render
  end
end
