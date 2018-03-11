# frozen_string_literal: true

class TransactionsController < ApplicationController
  # before_action :set_transaction, only: %i[edit update destroy]

  def index
    @transactions = current_user.transactions.order(created_at: :desc).page(params[:page]).per(5)
    # @transaction = Transaction.paginate(:page => params[:page], :per_page => 5).where(user: current_user)
  end

  # def new
  #   @transaction = current_user.entries.new
  # end

  # def edit; end

  def create
    @transaction = current_user.transactions.new(transaction_params)

    if @transaction.save
      redirect_to root_path, notice: I18n.t('transactions.transaction_created')
    else
      render 'home/index'
    end
  end

  # def update
  #   if @transaction.update(transaction_params)
  #     redirect_to root_path, notice: 'transaction was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @transaction.destroy
  #   redirect_to root_path, notice: 'transaction was successfully destroyed.'
  # end

  private

  # def set_transaction
  #   @transaction = transaction.find(params[:id])
  # end

  def transaction_params
    params.require(:transaction)
      .permit(:amount, :kind, :comment, :user_id, :date)
  end
end
