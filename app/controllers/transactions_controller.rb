class TransactionsController < ApplicationController
  # before_action :set_transaction, only: %i[edit update destroy]

  # def new
  #   @transaction = current_user.entries.new
  # end

  # def edit; end

  def create
    @transaction = current_user.transactions.new(transaction_params)

    if @transaction.save
      redirect_to root_path, notice: 'transaction was successfully created.'
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
