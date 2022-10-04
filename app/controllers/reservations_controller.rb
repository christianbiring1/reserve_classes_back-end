class ReservationsController < ApplicationController
    # include CurrentUserConcern
    def all
        if @current_user
        render json: {

            status: 200,
            res:"his is tthe list of all reservaions",
            user: @current_user
            }
        else
            render json: {status: 401,
            res: "you need to login in order to see you reservations"
            }
        end
    end

    def create
        reservation = Reservation.create!(new_reservation_params)
        if reservation.save
            render json: {
                status: 200,
                res:"New Class reserved successful",
            }
        else
            render json: {

                status: 404,
                res:"Try again, some tthing went wrong",
            }
        end
    end

    private

    def new_reservation_params
      params.require(:reservation).permit( :date, :group_id, :user_id)
    end

end