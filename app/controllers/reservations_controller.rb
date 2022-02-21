class ReservationsController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to  @reservation
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation=Reservation.new(reservation_params)
    @reservation.many_days = ( @reservation.end_date.to_i - @reservation.start_date.to_i ) / 86400 
    @reservation.total_price = @room.price * @reservation.persons * @reservation.many_days
  end

  private
    def reservation_params
     params.require(:reservation).permit(:start_date, :end_date, :total_price, :persons, :many_days, :user_id, :room_id)
    end
end
