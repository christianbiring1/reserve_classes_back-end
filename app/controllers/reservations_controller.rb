class ReservationsController < ApplicationController
  def index
    reservations = Reservation.all
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
    if Reservation.find(params[:id]).destroy
      render json: { message: 'Deleted!' }
    else
      render json: { error: 'Unable to delete reservation' }, status: :unprocessable_entity
    end
  end

  private

  def new_reservation_params
    params.require(:reservation).permit(:date, :group_id, :city, :user_id)
  end
end
