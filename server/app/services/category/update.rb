# frozen_string_literal: true

class Category::Update < ApplicationService
  class Form < Polist::Service::Form
    attribute :name
    attribute :category

    validates :name, presence: true
  end

  delegate :category, to: :form

  def call
    validate!

    category.update(provided_attributes.except(:category))
    success!(category: render_model(category), status: :ok)
  end

  def status
    if success?
      form.category.new? ? :created : :ok
    else
      :unprocessable_entity
    end
  end
end
