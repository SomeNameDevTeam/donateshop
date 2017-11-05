# frozen_string_literal: true

class Modifier < Sequel::Model
  many_to_one :category
end
