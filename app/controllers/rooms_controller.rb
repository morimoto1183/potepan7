class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    @room.save
    redirect_to :rooms
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to room_path(@room)
  end
  
  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end

  def posts
    @rooms = Room.all
  end
  
  def search
   if params[:search_area].present?
    @rooms = Room.where('rooms.address LIKE(?)', "%#{params[:search_area]}%")
    @search_result = "#{params[:search_area]}"
   elsif params[:search].present?
    @rooms = Room.where('rooms.title LIKE(?)', "%#{params[:search]}%")
    @search_result = "#{params[:search]}"
   end
  end
  
  private
  def room_params
   params.require(:room).permit(:title, :introduction, :address, :price, :image, :search, :search_area) 
  end
end
