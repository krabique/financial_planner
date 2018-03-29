# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[edit update destroy]
  before_action :set_parent, only: %i[new create]

  def index
    @categories = Category.where(user: current_user).order(:name)
  end

  def new
    @category = @parent.sub_categories.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @category = CreateCategoryService.new(parent: @parent, params: category_params).call

    if @category.persisted?
      redirect_back fallback_location: root_path,
                    notice: I18n.t('categories.category_created')
    else
      render :form
    end
  end

  def update
    if @category.update(category_params)
      redirect_back fallback_location: root_path,
                    notice: I18n.t('categories.category_updated')
    else
      render :form
    end
  end

  def destroy
    @category.destroy
    redirect_back fallback_location: root_path,
                  notice: I18n.t('categories.category_destroyed')
  end

  private

  def set_parent
    @parent ||= current_category || current_user
  end

  def set_category
    @category = Category.find(params[:id])
    authorize @category
  end

  def current_category
    category_id = params[:category_id]
    current_user.categories.find_by(id: category_id) if category_id.present?
  end

  def category_params
    params.require(:category).permit(:name).merge(user: current_user)
  end
end
