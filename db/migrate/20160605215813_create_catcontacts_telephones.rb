class CreateCatcontactsTelephones < ActiveRecord::Migration
  def change
    create_table :catcontacts_telephones do |t|
      t.string :number
      t.string :description
      t.boolean :textable
      t.integer :catcontacts_carrier_id
      t.references :catcontacts_contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
