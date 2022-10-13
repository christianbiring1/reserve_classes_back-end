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
    reservation =  @current_user.Reservation.create!(new_reservation_params)
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

  private

  def new_reservation_params
    params.require(:reservation).permit(:date, :group_id, :city)
  end
end
