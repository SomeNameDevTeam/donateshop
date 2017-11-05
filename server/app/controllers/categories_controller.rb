# frozen_string_literal: true

class CategoriesController < ApplicationController
  load_and_authorize_resource except: :update

  def destroy
    process_with_service!(Category::Destroy, @category)
  end

  def index
    render json: { categories: render_models(@categories), status: :ok }
  end

  def show
    render json: { categories: render_model(@category), status: :ok }
  end

  def update
    category = Category[params[:id]] || Category.new
    category.id ||= params[:id]
    category.new? ? can?(:create, Category) : can?(:edit, category)
    process_with_service(Category::Update, form_params, category: category)
  end

  private

  def form_params
    params.require(:category).permit(:name)
  end
end
