# frozen_string_literal: true

class Category < Sequel::Model
  def self.custom_lookup(url)
    first!(url: url)
  end
end
