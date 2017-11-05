# frozen_string_literal: true

class User::Form < Polist::Service::Form
  attribute :email
  attribute :password
  attribute :user

  validates :email, format: /.+@.+\..+/, if: -> { attribute_provided?(:email) }
  validates :password, length: { minimum: 6 }, if: -> { attribute_provided?(:password) }

  validate :uniq_email

  def uniq_email
    scope = User.dataset
    scope = scope.exclude(id: user.id) if user&.id
    return unless scope.first(email: email)
    errors.add :email, :not_unique
  end
end
