# frozen_string_literal: true

class Category::Update < ApplicationService
  # FIXME: add modifiers support
  class Form < Polist::Service::Form
    attribute :name
    attribute :category

    validates :name, presence: true
  end

  def call
    validate!

    category = form.category || Category.new(url: url)

    category.update(**provided_attributes.except(:category), modifiers: Sequel.pg_array([]))
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
