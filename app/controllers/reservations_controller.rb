class ReservationsController < ApplicationController
    before_action :set_reservation, only: [:destroy]
    
    def index
        render json: Reservation.all
    end 

    def show
        reservation = set_reservation
        if reservation
            render json: reservation
        else
            render json: {error: "No reservation found"}
        end 
    end 

    def create 
        reservation = Reservation.new(reservation_params)

        if reservation.save
            render json: {reservation: reservation, message: "Created Successfully"}
        end 
    end 

    def destroy
        reservation.destroy
    end 

    private

    def set_reservation
        reservation = Reservation.find(params[:id])
    end 

    def reservation_params
        params.require(:reservation).permit(:restaurant_name, :booked_time, :booked_email, :notes, :reserved, :user_id)
    end 
end
