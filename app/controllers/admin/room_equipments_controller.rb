class Admin::RoomEquipmentsController < ApplicationController
  before_action :require_admin

  def index
    @room_equipments = RoomEquipment.all
  end

  def new
    @room_equipment = RoomEquipment.new
  end

  def create
    @room_equipment = RoomEquipment.new(room_equipment_params)
    if @room_equipment.save
      redirect_to admin_room_equipments_path, notice: 'Dodano sprzęt.'
    else
      render :new
    end
  end

  def edit
    @room_equipment = RoomEquipment.find(params[:id])
  end

  def update
    @room_equipment = RoomEquipment.find(params[:id])
    if @room_equipment.update(room_equipment_params)
      redirect_to admin_room_equipments_path, notice: 'Edytowano sprzęt.'
    else
      render :edit
    end
  end

  def destroy
    @room_equipment = RoomEquipment.find(params[:id])
    @room_equipment.destroy
    redirect_to admin_room_equipments_path, notice: 'Usunięto sprzęt.'
  end

  private

  def room_equipment_params
    params.require(:room_equipment).permit(:name, :description, :quantity)
  end

  def require_admin
    redirect_to root_path, alert: 'Brak autoryzacji.' unless current_user&.admin?
  end
end
