# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :categories do
      primary_key :url, type: :text
      column :name, :text, null: false
      column :modifiers, :"text[]", null: false, default: []
    end
  end
end
