# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET #new' do
    it 'renders the :form template' do
      get :new, format: :js, xhr: true
      expect(response).to render_template :form
    end
  end

  describe 'GET #edit' do
    let(:transaction) { create(:transaction, user: user) }

    it 'renders the :form template' do
      get :edit, format: :js, xhr: true, params: {id: transaction.id}
      expect(response).to render_template :form
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new transaction in the database' do
        expect do
          post :create, xhr: true, params: {transaction: attributes_for(:transaction)}
        end.to change(Transaction, :count).by(1)
      end

      it 'redirects to the home page' do
        post :create, xhr: true, params: {transaction: attributes_for(:transaction)}
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new transaction in the database' do
        expect do
          post :create, xhr: true, params: {transaction: attributes_for(:invalid_transaction)}
        end.to_not change(Transaction, :count)
      end

      it 're-renders the :form template' do
        post :create, xhr: true, params: {transaction: attributes_for(:invalid_transaction)}
        expect(response).to render_template :form
      end
    end

    context 'when trying to create a transaction for another user' do
      let(:another_user) { create(:user) }

      it 'does not save the new transaction in the database' do
        post :create, xhr: true, params: {transaction: attributes_for(
          :transaction, user_id: another_user.id
        )}
        expect(Transaction.last.user).to_not eq another_user
      end

      it 'redirects to the home page' do
        post :create, xhr: true, params: {transaction: attributes_for(
          :transaction, user_id: another_user.id
        )}
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PUT #update' do
    let(:transaction) { create(:transaction, user: user) }

    context 'with valid attributes' do
      it "changes the transaction's comment and saves it to the database" do
        comment = Faker::HarryPotter.quote[0..79]

        put :update, xhr: true, params: {id: transaction.id, transaction: {comment: comment}}

        assigns(:transaction).reload

        expect(assigns(:transaction).comment).to eq comment
      end

      it 'redirects to the home page' do
        from root_path
        comment = Faker::HarryPotter.quote[0..79]
        put :update, xhr: true, params: {id: transaction.id, transaction: {comment: comment}}
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      context 'for amount' do
        it 'does not update the transaction' do
          initial_amount = transaction.amount

          put :update, xhr: true, params: {id: transaction.id, transaction: {amount: 'abc'}}

          assigns(:transaction).reload

          expect(assigns(:transaction).amount).to eq initial_amount
        end

        it 're-renders the :form template' do
          put :update, xhr: true, params: {id: transaction.id, transaction: {amount: 'abc'}}

          expect(response).to render_template :form
        end
      end
    end

    # context "when user is trying to update someone else's transaction" do
    #   it 'should not update the transaction' do
    #     other_user_transaction = create(:transaction, user: create(:user))

    #     initial_comment = other_user_transaction.comment

    #     put :update, xhr: true, params: {
    #       id: other_user_transaction.id,
    #       transaction: { comment: initial_comment + 'abc' }
    #     }

    #     assigns(:transaction).reload

    #     expect(assigns(:transaction).comment).to eq initial_comment
    #   end
    # end
  end

  describe 'DELETE #destroy' do
    context "with user's own transactions" do
      let!(:transaction) { create(:transaction, user: user) }

      it 'destroys the transaction' do
        expect do
          delete :destroy, params: {id: transaction.id}
        end.to change(Transaction, :count).by(-1)
      end
    end

    # context "with other users' transactions" do
    #   let!(:user) { create(:user) }
    #   let(:another_user) { create(:user) }
    #   let!(:others_transaction) { create(:transaction, user: another_user) }

    #   it 'does not destroy the transaction' do
    #     expect do
    #       delete :destroy, params: { id: others_transaction.id }
    #     end.to_not change(Transaction, :count)
    #   end

    #   it 'redirects to the home page' do
    #     delete :destroy, params: { id: others_transaction.id }
    #     expect(response).to redirect_to root_path
    #   end
    # end
  end
end
