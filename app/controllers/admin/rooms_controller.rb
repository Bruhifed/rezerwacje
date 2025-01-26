class Admin::RoomsController < ApplicationController
  before_action :require_admin

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to admin_rooms_path, notice: 'Dodano pokój.'
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to admin_rooms_path, notice: 'Edytowano pokój.'
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to admin_rooms_path, notice: 'Usunięto pokój.'
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :capacity)
  end

  def require_admin
    redirect_to root_path, alert: 'Brak autoryzacji.' unless current_user&.admin?
  end
end
