module ApplicationHelper

    def location_from_zip(zip)
      location_hash = ZipCodes.identify(zip)
      "#{location_hash[:city]}, #{location_hash[:state_code]}"
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

end
