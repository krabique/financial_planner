# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :require_login, only: :index

  def index
    current_user_transactions = current_user.transactions
    @transaction = current_user_transactions.new
    @transactions = current_user_transactions.last_ten
  end

  private

  def require_login
    render :landing if current_user.blank?
  end
end
