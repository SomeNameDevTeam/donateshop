# frozen_string_literal: true

module RenderModel
  def render_model(model, action = :show, **extra)
    ApplicationController.render(
      template: "#{model.class.model_name.plural}/#{action}",
      assigns: { model.class.model_name.singular => model, **extra }
    )
  end

  def render_models(models, action = :show, **extra)
    models.map { |model| render_model(model, action, extra) }
  end
end
