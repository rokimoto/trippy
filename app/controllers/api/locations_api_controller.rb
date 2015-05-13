module Api
  class LocationsApiController < ActionController::Base
    protect_from_forgery with: :null_session
  
    def index
      locations = Location.all
      render json: locations
    end

    def search_name
      location = Location.where("LOWER(name) LIKE ?","%#{params[:search].downcase}%") || Location.new(latitude: 0, longitude: 0)
      render json: location
    end

    def search_location
      locations = Location.near(params[:search], 10, :order => "distance")
      render json: locations
    end

    def reviews
      reviews = Location.find(params[:id]).reviews
      render json: reviews
    end

    def yelp
      yelp_data = Yelp.client.business(params[:id])
      render json: yelp_data
    end

  end
end