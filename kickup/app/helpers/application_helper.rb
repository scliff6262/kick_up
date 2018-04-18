module ApplicationHelper

    def location_from_zip(zip)
      location_hash = ZipCodes.identify(zip)
      "#{location_hash[:city]}, #{location_hash[:state_code]}"
    end

end
