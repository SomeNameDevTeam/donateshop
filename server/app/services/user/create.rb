# frozen_string_literal: true

class User::Create < ApplicationService
  class Form < User::Form
    validates :password, presence: true
    validates :email, presence: true
  end

  def call
    validate!
    user = User.create(form.attributes.slice(:email, :password))
    run_service(Session::Create, user: user)
  end

  def status
    success? ? :created : :unprocessable_entity
  end
end
