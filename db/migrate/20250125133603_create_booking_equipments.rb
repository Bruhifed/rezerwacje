class CreateBookingEquipments < ActiveRecord::Migration[8.0]
  def change
    create_table :booking_equipments do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :room_equipment, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
