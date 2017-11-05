# frozen_string_literal: true

class ModifiersController < ApplicationController
  load_and_authorize_resource except: :update

  def destroy
    process_with_service!(Modifier::Destroy, @modifier)
  end

  def index
    render json: { modifiers: render_models(@modifiers), status: :ok }
  end

  def update
    modifier_for_update.new? ? can?(:create, Modifier) : can?(:edit, modifier_for_update)
    process_with_service(Modifier::Update, form_params, modifier: modifier_for_update)
  end

  private

  memoize def modifier_for_update
    category = Category.first!(id: params[:category_id])
    modifier = category.modifiers_dataset.first(id: params[:id]) || Modifier.new(category: category)
    modifier.id ||= params[:id]
    modifier
  end

  def form_params
    params.require(:modifier).permit(:name, :possible_values)
  end
end
