# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[edit update destroy]

  def index
    @transactions = current_user.transactions
      .order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @transaction = current_user.transactions.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)

    if @transaction.save
      redirect_back fallback_location: root_path,
                    notice: I18n.t('transactions.transaction_created')
    else
      render :form
    end
  end

  def update
    if @transaction.update(transaction_params)
      redirect_back fallback_location: root_path,
                    notice: I18n.t('transactions.transaction_updated')
    else
      render :form
    end
  end

  def destroy
    @transaction.destroy
    redirect_to root_path, notice: I18n.t('transactions.transaction_destroyed')
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :comment, :date)
  end
end
