# frozen_string_literal: true

class Session::Create < ApplicationService
  extend Memoist

  class Form < Polist::Service::Form
    attribute :email
    attribute :password
    attribute :user
  end

  def call
    fail!(errors: { base: %w[bad_credentials] }) unless user

    Session.create(user: user) do |session|
      session.token = generate_token
      success!(status: :ok, token: session.token, user_id: user.id)
    end
  end

  def status
    success? ? :created : :unprocessable_entity
  end

  private

  def generate_token
    SecureRandom.base64(128)
  end

  memoize def user
    return form.user if form.attribute_provided?(:user)
    user = User.find(email: form.email)
    return if user.password != form.password
    user
  end
end
