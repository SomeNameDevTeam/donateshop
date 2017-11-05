# frozen_string_literal: true

class ApplicationController < ActionController::API
  extend Memoist
  include CanCan::ControllerAdditions
  include RenderModel

  BadToken = Class.new(StandardError)

  rescue_from(BadToken) do
    render json: { status: "bad token" }, status: :unauthorized
  end

  rescue_from(CanCan::AccessDenied) do
    render json: { status: "forbidden" }, status: :forbidden
  end

  rescue_from(Sequel::NoMatchingRow) do
    render json: { status: "not found" }, status: :not_found
  end

  private

  def user_session
    user_token = request.headers["X-USER-TOKEN"] or return
    session = Session[user_token] or raise BadToken
    session.save # update updated_at
    session
  end

  memoize def current_user
    user_session&.user
  end

  def process_with_service!(service, *params)
    result = service.run(*params)
    render json: result.response.to_camelback_keys, status: result.status
  end

  def process_with_service(service, *params)
    options = params.reduce({}, &:merge)
    process_with_service!(service, options)
  end
end
