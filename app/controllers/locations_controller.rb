class LocationsController < ApplicationController
    def index
    if params[:search].present?
      if params[:search_type] == "Name"
        @target = Location.where("LOWER(name) LIKE ?","%#{params[:search].downcase}%").first || nil
        if @target
          @locations = Location.near(@target.address, 10, :order => "distance")
        else
          flash[:danger] = "No matches found!"
          @locations = nil
          @target = nil
        end
        @hash = build_gmap_markers(@target)
      elsif params[:search_type] == "Location"
        if Location.near(params[:search], 10)
          @locations = Location.near(params[:search], 10, :order => "distance")
        else
          flash[:danger] = "No matches found!"
          @locations = Location.all
        end
        @hash = build_gmap_markers(@locations)
      end
    else
      @locations = Location.all
      @hash = build_gmap_markers(@locations)
    end
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.create(location_params)
    if @location.save
      flash[:success] = "Your location was created!"
      redirect_to @location
    else
      flash[:danger] = @location.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  private
  def location_params
    params.require(:location).permit(:name, :address, :latitude, :longitude)
  end

  def build_gmap_markers(locations)
    Gmaps4rails.build_markers(locations) do |location, marker|
        marker.lat location.latitude
        marker.lng location.longitude
        marker.infowindow location.name
        marker.picture({
           "url" => "http://icons.iconarchive.com/icons/icons8/windows-8/16/Food-Mushroom-icon.png",
           "width" =>  32,
           "height" => 32})
    end
  end

end
