require 'smarter_csv'

module Catcontacts
  class Client < ActiveRecord::Base
    belongs_to :primary_contact, class_name: "Catcontacts::Contact", foreign_key: "catcontacts_contact_id"
    belongs_to :primary_address, class_name: "Catcontacts::Address", foreign_key: "catcontacts_address_id"

    def self.import_pcode(filename = '/Users/jeff/Downloads/pcode.csv')
      pcode = SmarterCSV.process(filename)
      pcode.each do |p|
        c = Catcontacts::Client.new
        c.name = p[:name]
        c.ident = p[:cust_id].to_i
        c.source = 'pcode'
        addr = Catcontacts::Address.new
        addr.aline1 = p[:address]
        addr.city = p[:city]
        addr.region = p[:state]
        addr.postal = p[:zip]
        addr.save
        addr.reload
        pc = Catcontacts::Contact.new
        if p[:name] =~ /,/
          name = p[:name].split(',')
          pc.first_name = name.last
          pc.last_name = name.first
        else
          name = p[:name].split(' ')
          pc.first_name = name.first
          pc.last_name = name.last
        end
        pc.save
        pc.reload
        unless p[:email].blank?
          em = Catcontacts::Email.new
          em.address = p[:email]
          em.contact = pc
          em.save
        end
        unless p[:home_phone].blank?
          hp = Catcontacts::Telephone.new
          hp.number = p[:home_phone]
          hp.number = hp.local
          hp.description = 'home phone'
          hp.contact = pc
          hp.save
        end
        c.primary_contact = pc
        c.primary_address = addr
        c.save
      end
      true
    end
  end
end
