module Api
  class LocationsApiController < ActionController::Base
    protect_from_forgery with: :null_session
  
    def index
      locations = Location.all
      render json: locations
    end

    def search_name
      location = Location.where("LOWER(name) LIKE ?","%#{params[:search].downcase}%").first || Location.new(latitude: 0, longitude: 0)
      render json: location
    end

    def search_location
      locations = Location.near(params[:search], 10, :order => "distance")
      render json: locations
    end
  
  end
end