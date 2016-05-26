module Catcontacts
  class Company < ActiveRecord::Base

    def sic_codes_list
      self.sic_codes.join(', ')
    end

    def sic_codes_list=(new_value)
      self.sic_codes = new_value.split(',')
      s1 = Set.new
      self.sic_codes.each do |val|
        s1 << val.strip.downcase
      end
      self.sic_codes = s1.to_a
    end

    def naics_codes_list
      self.naics_codes.join(', ')
    end

    def naics_codes_list=(new_value)
      self.naics_codes = new_value.split(',')
      s1 = Set.new
      self.naics_codes.each do |val|
        s1 << val.strip.downcase
      end
      self.naics_codes = s1.to_a
    end

  end
end
