class CreateCatcontactsClients < ActiveRecord::Migration
  def change
    create_table :catcontacts_clients do |t|
      t.string  :name         # name of account
      t.integer :ident        # numeric client number
      t.string  :identstr     # string ident - UUID
      t.string  :stage        # lead, prospect, current, former
      t.string  :source       # where did this client come from
      t.references :catcontacts_contact, index: true, foreign_key: true  # primary contact
      t.references :catcontacts_address, index: true, foreign_key: true  # primary address
      t.references :catcontacts_business, index: true, foreign_key: true  # business associated with client
      t.jsonb  :data, default: {}, null: false

      t.timestamps null: false
    end
    add_index :catcontacts_clients, :data, using: 'gin'
  end
end
