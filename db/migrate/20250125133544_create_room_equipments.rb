class CreateRoomEquipments < ActiveRecord::Migration[8.0]
  def change
    create_table :room_equipments do |t|
      t.string :name, null: false
      t.text :description
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
