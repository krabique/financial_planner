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
    render
  end

  def modal
    render
  end
end
