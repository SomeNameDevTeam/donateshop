# frozen_string_literal: true

class Modifier::Update < ApplicationService
  class Form < Polist::Service::Form
    attribute :modifier
    attribute :name
    attribute :possible_values, default: -> { [id, ""] }

    validates :name, presence: true
  end

  delegate :modifier, to: :form

  def call
    validate!

    # TODO: Check items using old available values

    modifier.update(provided_attributes.except(:modifier))
    success!(modifier: render_model(modifier), status: :ok)
  end

  def status
    if success?
      form.modifier.new? ? :created : :ok
    else
      :unprocessable_entity
    end
  end
end
