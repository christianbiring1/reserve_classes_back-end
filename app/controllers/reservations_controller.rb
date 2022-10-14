class ReservationsController < ApplicationController
  def index
    reservations = @current_user.reservations
    if reservations
      render json: {
        status: 200,
        data: reservations
      }
    else
      render json: {
        status: 404,
        res: 'The reservation list is now empty'
      }
    end
  end

  def create
    reservation = Reservation.create(new_reservation_params)
    if reservation.save
      render json: {
        status: 200,
        res: 'New Class reserved successful'
      }
    else
      render json: {

        status: 404,
        res: 'Try again, some thing went wrong'
      }
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    render json: 'The reservation has been cancelled!'
  end

  private

  def new_reservation_params
    params.require(:reservation).permit(:date, :group_id, :city, :user_id)
  end
end
