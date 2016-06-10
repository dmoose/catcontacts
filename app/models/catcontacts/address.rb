module Catcontacts
  class Address < ActiveRecord::Base

    geocoded_by :full_street_address do |obj,results|
      if geo = results.first
        obj.city     = geo.city
        obj.region   = geo.state
        obj.postal   = geo.postal_code
        obj.country  = geo.country
        obj.latitude  = geo.latitude
        obj.longitude  = geo.longitude
        obj.data[:geocode] = geo.data
        obj.geocoded = true
        unless geo.data['address_components'].nil?
          geo.data['address_components'].each do |c|
            case c['types'].first
            when 'street_number'
              obj.aline1 = c['long_name']
            when 'route'
              obj.aline1 = obj.aline1 + ' ' + c['long_name']
            when 'locality'
            when 'administrative_area_level_2'
              obj.county = c['long_name']
            when 'administrative_area_level_1'
            when 'country'
            when 'postal_code'
            when 'postal_code_suffix'
            end
          end
        end
        unless geo.data['formatted_address'].nil?
          obj.formatted_address = geo.data['formatted_address'] 
        end
      end
    end

    reverse_geocoded_by :latitude, :longitude do |obj,results|
      if geo = results.first
        obj.city     = geo.city
        obj.region   = geo.state
        obj.postal   = geo.postal_code
        obj.country  = geo.country
        obj.data[:reverse_geocode] = geo.data
        obj.reverse_geocoded = true
        unless geo.data['address_components'].nil?
          geo.data['address_components'].each do |c|
            case c['types'].first
            when 'street_number'
              obj.aline1 = c['long_name']
            when 'route'
              obj.aline1 = obj.aline1 + ' ' + c['long_name']
            when 'locality'
            when 'administrative_area_level_2'
              obj.county = c['long_name']
            when 'administrative_area_level_1'
            when 'country'
            when 'postal_code'
            when 'postal_code_suffix'
            end
          end
        end
        unless geo.data['formatted_address'].nil?
          obj.formatted_address = geo.data['formatted_address'] 
        end
      end
    end

    def address= (addr)
      addr
    end

    def full_street_address
      [aline1, city, region, country].compact.join(', ')
    end

  end
end
