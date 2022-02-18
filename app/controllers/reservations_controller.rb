class ReservationsController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to  @reservation
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  def confirm
    @room = Room.find(params[:room_id])
    @reservation=Reservation.new(reservation_params)
    @reservation.many_days = ( @reservation.end_date.to_i - @reservation.start_date.to_i ) / 86400 
    @reservation.total_price = @room.price * @reservation.people * @reservation.many_days
  end

  private
  
    def reservation_params
     params.require(:reservation).permit(:start_date, :end_date, :total_price, :persons, :many_days, :user_id, :room_id)
    end
end
