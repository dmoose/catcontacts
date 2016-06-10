class CreateCatcontactsAddresses < ActiveRecord::Migration
  def change
    create_table :catcontacts_addresses do |t|
      t.string :aline1
      t.string :aline2
      t.string :aline3
      t.string :city
      t.string :region
      t.string :postal
      t.string :county
      t.string :country
      t.string :formatted_address
      t.float  :latitude
      t.float  :longitude
      t.boolean :geocoded
      t.boolean :reverse_geocoded
      t.jsonb  :data, default: {}, null: false

      t.index  :latitude
      t.index  :longitude
      t.index  :postal

      t.timestamps null: false
    end
    add_index :catcontacts_addresses, :data, using: 'gin'
  end
end
