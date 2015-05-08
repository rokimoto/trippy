module Api
  class LocationsApiController < ActionController::Base
    protect_from_forgery with: :null_session
  
    def index
      locations = Location.all
      render json: locations
    end
  
  end
end