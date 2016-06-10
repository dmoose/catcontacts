class CreateCatcontactsContacts < ActiveRecord::Migration
  def change
    create_table :catcontacts_contacts do |t|
      t.string :honor
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :generation
      t.string :title
      t.jsonb  :data, default: {}, null: false

      t.index :last_name

      t.timestamps null: false
    end
    add_index :catcontacts_contacts, :data, using: 'gin'
  end
end
