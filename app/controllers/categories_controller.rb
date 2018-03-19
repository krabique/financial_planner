# frozen_string_literal: true

class CategoriesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_category, only: %i[edit update destroy]
  before_action :set_parent, only: %i[new create]

  def index
    @categories = current_user.categories
  end

  def new
    @category = @parent.categories.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @category = CreateCategoryService.new(parent: @parent, params: category_params).call
    redirect_back fallback_location: root_path,
                  notice: I18n.t('categories.category_created')
  rescue ActiveRecord::RecordInvalid
    render :form
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
    # authorize @category
  end

  def current_category
    category_id = params[:category_id]
    return if category_id.blank?

    Category.find_by(category_id)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
