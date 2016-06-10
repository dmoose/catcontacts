module Catcontacts
  class Email < ActiveRecord::Base
    belongs_to :contact, class_name: "Catcontacts::Contact", foreign_key: "catcontacts_contact_id"

  end
end
