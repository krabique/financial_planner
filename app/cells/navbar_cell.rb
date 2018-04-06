# frozen_string_literal: true

# The navbar cell
class NavbarCell < ApplicationCell
  def show
    if current_user
      balance_service = BalanceService.new(current_user)
      @balance = balance_service.balance
      @open_money = balance_service.open_money
    end

    render
  end

  private

  def current_user_link(path)
    @path = path
    render
  end
end
