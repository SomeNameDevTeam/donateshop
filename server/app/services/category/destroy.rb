# frozen_string_literal: true

class Category::Destroy < ApplicationService
  def initialize(category)
    self.category = category
  end

  private

  def call
    # FIXME: check no articles left
    category.delete

    success!(status: :ok)
  end

  attr_accessor :category
end
