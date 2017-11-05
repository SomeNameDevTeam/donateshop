# frozen_string_literal: true

class Session < Sequel::Model
  plugin :timestamps, update_on_create: true

  many_to_one :user
end
