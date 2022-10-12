class RegistrationsController < ApplicationController
  def create
    user = User.create!(user_register_params)
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user:
      }
    else
      render json: { status: 500 }
    end
  end

  private

  def user_register_params
    params.permit(:name, :email, :password)
  end
end
