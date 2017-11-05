# frozen_string_literal: true

json.call(category, :id, :name)
json.modifiers(category.modifiers, partial: "modifiers/show", as: :modifier)
