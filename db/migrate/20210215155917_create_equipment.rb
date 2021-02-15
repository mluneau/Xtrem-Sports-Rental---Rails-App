class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :title
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :daily_price
      t.string :sport_category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
