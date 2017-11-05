# frozen_string_literal: true

class UsersController < ApplicationController
  load_and_authorize_resource

  def create
    process_with_service(User::Create, params.require(:user).permit(:email, :password))
  end

  def index
    render json: { users: render_models(@users), status: :ok }
  end

  def show
    render json: { user: render_model(@user), status: :ok }
  end

  def update
    permited_fiels = %i[email password]
    permited_fiels << :role if can?(:set_role, @user)

    process_with_service(
      User::Update,
      params.require(:user).permit(permited_fiels),
      user: @user
    )
  end
end
