module Catcontacts
  class Telephone < ActiveRecord::Base
    belongs_to :contact, class_name: "Catcontacts::Contact", foreign_key: "catcontacts_contact_id"

    def phone_valid?
      phone_parse
    end

    def geo_name
      if (phone_parse)
        @parsed_number.geo_name
      else
        nil
      end
    end

    def timezone
      if (phone_parse)
        @parsed_number.timezone
      else
        nil
      end
    end

    def area_code
      if (phone_parse)
        @parsed_number.area_code
      else
        nil
      end
    end

    def country
      if (phone_parse)
        @parsed_number.country
      else
        nil
      end
    end

    def country_code
      if (phone_parse)
        @parsed_number.country_code
      else
        nil
      end
    end

    def local
      if (phone_parse)
        @parsed_number.local_number
      else
        nil
      end
    end

    def national
      if (phone_parse)
        @parsed_number.national
      else
        nil
      end
    end

    def international
      if (phone_parse)
        @parsed_number.international
      else
        nil
      end
    end

    private

    def phone_parse
      @parsed_number ||= Phonelib.parse self.number
      @parsed_number.valid?
    end
  end
end
