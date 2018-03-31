# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns instance variable' do
      get :index
      expect(assigns(:categories)).to eq Category.where(user: user).order(:name)
    end
  end

  describe 'GET #new' do
    let(:category) { create(:category_not_nested, user: user) }

    it 'renders the :form template' do
      get :new, format: :js, xhr: true
      expect(response).to render_template :form
    end

    it 'assigns instance variable for nested category' do
      get :new, format: :js, xhr: true, params: {category_id: category.id}
      expect(assigns(:parent)).to eq category
      expect(assigns(:category).attributes).to eq category.sub_categories.new.attributes
    end

    it 'assigns instance variable for not nested category' do
      get :new, format: :js, xhr: true
      expect(assigns(:parent)).to eq user
      expect(assigns(:category).attributes).to eq user.sub_categories.new.attributes
    end
  end

  describe 'GET #edit' do
    let(:category) { create(:category_not_nested, user: user) }

    it 'renders the :form template' do
      get :edit, format: :js, xhr: true, params: {id: category.id}
      expect(response).to render_template :form
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new category in the database' do
        expect do
          post :create, xhr: true, params: {category: attributes_for(:category)}
        end.to change(Category, :count).by(1)
      end

      it 'redirects to the home page' do
        post :create, xhr: true, params: {category: attributes_for(:category)}
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new category in the database' do
        expect do
          post :create, xhr: true, params: {category: attributes_for(:invalid_category)}
        end.to_not change(Category, :count)
      end

      it 're-renders the :form template' do
        post :create, xhr: true, params: {category: attributes_for(:invalid_category)}
        expect(response).to render_template :form
      end
    end

    context 'when trying to create a category for another user' do
      let(:another_user) { create(:user) }

      it 'does not save the new category in the database' do
        post :create, xhr: true, params: {category: attributes_for(
          :category, user_id: another_user.id
        )}
        expect(Category.last.user).to_not eq another_user
      end

      it 'redirects to the home page' do
        post :create, xhr: true, params: {category: attributes_for(
          :category, user_id: another_user.id
        )}
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PUT #update' do
    let(:category) { create(:category_not_nested, user: user) }

    context 'with valid attributes' do
      it "changes the category's name and saves it to the database" do
        name = Faker::HarryPotter.location

        put :update, xhr: true, params: {id: category.id, category: {name: name}}

        assigns(:category).reload

        expect(assigns(:category).name).to eq name
      end

      it 'redirects to the home page' do
        from root_path
        name = Faker::HarryPotter.location
        put :update, xhr: true, params: {id: category.id, category: {name: name}}
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not update the category' do
        initial_name = category.name

        put :update, xhr: true, params: {id: category.id, category: {name: nil}}

        assigns(:category).reload

        expect(assigns(:category).name).to eq initial_name
      end

      it 're-renders the :form template' do
        put :update, xhr: true, params: {id: category.id, category: {name: nil}}

        expect(response).to render_template :form
      end
    end

    context "when user is trying to update someone else's category" do
      it 'should not update the category' do
        other_user_category = create(:category_not_nested, user: create(:user))

        initial_name = other_user_category.name

        put :update, xhr: true, params: {
          id: other_user_category.id,
          category: {name: initial_name + 'abc'}
        }

        assigns(:category).reload

        expect(assigns(:category).name).to eq initial_name
      end
    end
  end

  describe 'DELETE #destroy' do
    context "with user's own categories" do
      let!(:category) { create(:category_not_nested, user: user) }

      it 'destroys the category' do
        expect do
          delete :destroy, params: {id: category.id}
        end.to change(Category, :count).by(-1)
      end
    end

    context "with other users' categories" do
      let!(:user) { create(:user) }
      let(:another_user) { create(:user) }
      let!(:others_category) { create(:category_not_nested, user: another_user) }

      it 'does not destroy the category' do
        expect do
          delete :destroy, params: {id: others_category.id}
        end.to_not change(Category, :count)
      end

      it 'redirects to the home page' do
        delete :destroy, params: {id: others_category.id}
        expect(response).to redirect_to root_path
      end
    end
  end
end
