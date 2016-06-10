module Catcontacts
  class Contact < ActiveRecord::Base
    has_many :emails, class_name: 'Catcontacts::Email', foreign_key: 'catcontacts_contact_id'
    has_many :telephones, class_name: 'Catcontacts::Telephone', foreign_key: 'catcontacts_contact_id'
  end
end
