# frozen_string_literal: true

Sequel.migration do
  up do
    create_table :modifiers do
      primary_key :id, type: :text
      column :name, :text
      column :possible_values, :"text[]"
      foreign_key :category_id, :categories, type: :text
    end

    drop_column :categories, :modifiers
  end

  down do
    drop_table :modifiers

    add_column :categories, :modifiers, :"text[]"
  end
end
