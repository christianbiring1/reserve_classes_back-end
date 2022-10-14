class SessionsController < ApplicationController
  skip_before_action :authenticate_request, only: %i[create logout]

  def create
    user = User
      .find_by(email: params[:email])
      .try(:authenticate, params[:password])
    if user
      token = jwt_encode(user_id: user.id)
      render json: {
        status: 'Logged in successfully!',
        logged_in: true,
        user: @current_user,
        token:
      }
    else
      render json: { status: 'Incorrect email or password.' }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end
end
