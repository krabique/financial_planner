# frozen_string_literal: true

# The navbar cell
class NavbarCell < ApplicationCell
  def show
    @balance = Transaction.where(user: current_user).sum(:amount_cents)
      .to_money / 100
    render
  end

  private

  def current_user_link(path)
    @path = path
    render
  end
end
