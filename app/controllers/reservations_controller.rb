class ReservationsController < ApplicationController
    before_action :set_reservation, only:[:show, :edit, :destroy]
    
    def index
        render json: Reservation.all, include: :user 
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
        else
            render json: {error: reservation.errors}
        end 
    end 

    def update
        reservation = set_reservation
        if reservation
            reservation.update(reservation_params)
            render json: {reservation: reservation, message: "Updated Successfully"}
        else
            render json:{error: reservation.errors}
        end 
    end 

    def destroy
        reservation = set_reservation
        if reservation
            reservation.destroy
            render json: {reservation: reservation, message: "Your resevation was successfully deleted."}
        else
            render json:{error: "Reservation could not be edited."}
        end 
    end
 
    private

    def set_reservation
        reservation = Reservation.find(params[:id])
    end 

    def reservation_params
        params.require(:reservation).permit(:id, :restaurant_name, :booked_time, :booked_email, :notes, :reserved, :user_id)
    end 

end