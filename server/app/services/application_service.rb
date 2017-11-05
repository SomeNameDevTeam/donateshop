# frozen_string_literal: true

class ApplicationService < Polist::Service
  include RenderModel

  def self.run(*)
    DB.transaction { super }
  end

  def initialize(params)
    super(params.to_h)
  end

  def status
    success? ? :ok : :unprocessable_entity
  end

  private

  def validate!
    fail!(errors: form.errors, code: :unprocessable) if form.invalid?
  end

  def run_service(klass, *params)
    service = klass.run(*params)
    service.success? ? success!(service.response) : fail!(service.response)
  end

  def provided_attributes
    form.attributes.select { |key, _| form.attribute_provided?(key) }
  end
end
