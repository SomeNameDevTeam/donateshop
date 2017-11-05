# frozen_string_literal: true

class User::Update < ApplicationService
  class Form < User::Form
    attribute :role

    validates :role, inclusion: %w[user admin], if: -> { attribute_provided?(:role) }
  end

  delegate :user, to: :form

  def call
    validate!

    user.update(provided_attributes.except(:user))
    success!(user: render_model(user), status: :ok)
  end
end
