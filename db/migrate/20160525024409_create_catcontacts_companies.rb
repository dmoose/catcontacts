class CreateCatcontactsCompanies < ActiveRecord::Migration
  def change
    create_table :catcontacts_companies do |t|
      t.string :name
      t.text :sic_codes, array: true, default: []
      t.text :naics_codes, array: true, default: []
      t.integer :parent_id

      t.timestamps null: false
    end
    add_index :catcontacts_companies, :sic_codes, using: 'gin'
    add_index :catcontacts_companies, :naics_codes, using: 'gin'
  end
end
