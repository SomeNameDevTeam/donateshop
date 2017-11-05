# frozen_string_literal: true

class User < Sequel::Model
  one_to_many :sessions
  plugin :secure_password, include_validations: false
end
