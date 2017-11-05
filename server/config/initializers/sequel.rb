# frozen_string_literal: true

DB = Sequel::DATABASES.first

Sequel.extension :pg_enum
DB.extension :pg_array

Sequel::Model.include(CanCan::ModelAdditions)

require_dependency "cancan/model_adapters/sequel_adapter.rb"
