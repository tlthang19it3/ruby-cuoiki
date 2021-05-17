class CreatePitches < ActiveRecord::Migration[6.1]
  def change
    create_table :pitches do |t|

      t.string :pitch_name
      t.string :description
      t.references :owners, null: false, foreign_key: true
      t.string :city
      t.string :district
      t.string :address
      t.string :phone_number
      t.text :url_ggmap
      t.string :start_time
      t.string :end_time
      t.integer :price_per_hour
      t.integer :size
      t.text :avatar_url
    end
  end
end
