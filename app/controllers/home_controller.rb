# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @transaction = current_user.transactions.new if current_user
  end
end
