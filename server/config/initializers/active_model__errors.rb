# frozen_string_literal: true

class ActiveModel::Errors
  def generate_message(_attribute, type = :invalid, options = {})
    options.present? ? { code: type, **options } : type
  end
end
