class CreateCatcontactsEmails < ActiveRecord::Migration
  def change
    create_table :catcontacts_emails do |t|
      t.string :address
      t.string :description
      t.references :catcontacts_contact, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
