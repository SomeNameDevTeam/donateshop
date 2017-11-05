# frozen_string_literal: true

class CanCan::ModelAdapters::SequelAdapter < CanCan::ModelAdapters::AbstractAdapter
  def self.for_class?(model_class)
    model_class < Sequel::Model
  end

  # Override if you need custom find behavior
  def self.find(model_class, id)
    model_class.first!(model_class.primary_key => id)
  end

  def database_records
    @rules.reduce(@model_class.dataset) do |scope, rule|
      scope.where(rule.conditions)
    end
  end
end
