# frozen_string_literal: true

class Category < Sequel::Model
  one_to_many :modifiers
end
