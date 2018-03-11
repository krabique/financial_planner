# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @transaction = current_user.transactions.new if current_user
    @transactions = Transaction.last_ten(current_user)
    @balance = Transaction.where(user: current_user).sum(:amount_cents)
      .to_money / 100
  end
end
