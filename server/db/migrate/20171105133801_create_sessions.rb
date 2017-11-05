# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :sessions do
      primary_key :token, type: :text
      foreign_key :user_id, :users, null: false
      column :created_at, :timestamp, null: false
      column :updated_at, :timestamp, null: false
    end
  end
end
