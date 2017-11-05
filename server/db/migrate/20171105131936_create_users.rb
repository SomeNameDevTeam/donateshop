# frozen_string_literal: true

Sequel.migration do
  up do
    extension :pg_enum

    create_enum :user_role, %i[virtual user admin]

    create_table :users do
      primary_key :id

      column :email, :text, null: true, index: true, unique: true
      column :password_digest, :text, null: true
      column :role, :user_role, null: false, default: "user"
    end
  end

  down do
    extension :pg_enum

    drop_table :users
    drop_enum :user_role
  end
end
