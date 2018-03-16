# frozen_string_literal: true

# The navbar cell
class NavbarCell < ApplicationCell
  def show
    @balance = BalanceService.new(current_user).balance
    render
  end

  private

  def current_user_link(path)
    @path = path
    render
  end
end
