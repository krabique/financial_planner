# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :require_login, only: :index

  def index
    @transaction = current_user.transactions.new
    @transactions = Transaction.last_ten(current_user)
  end

  private

  def require_login
    render :landing if current_user.blank?
  end
end
