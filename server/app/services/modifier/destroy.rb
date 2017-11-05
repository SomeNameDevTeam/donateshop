# frozen_string_literal: true

class Modifier::Destroy < ApplicationService
  def initialize(modifier)
    self.modifier = modifier
  end

  private

  def call
    modifier.delete

    # TODO: check for modifier usage

    success!(status: :ok)
  end

  attr_accessor :modifier
end
