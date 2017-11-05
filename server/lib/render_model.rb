# frozen_string_literal: true

module RenderModel
  # FIXME: lack of performance because of extra dump / parse
  def render_model(model, action = :show, **extra)
    data = ApplicationController.render(
      partial: "#{model.class.model_name.plural}/#{action}",
      locals: { model.class.model_name.singular.to_sym => model, **extra }
    )

    JSON.parse(data)
  end

  def render_models(models, action = :show, **extra)
    models.map { |model| render_model(model, action, extra) }
  end
end
