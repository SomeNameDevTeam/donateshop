# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    run_service(Session::Create, params)
  end

  def destroy
    user_session&.delete
    render json: { status: :ok }
  end
end
