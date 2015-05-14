class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    if @like.save 
      flash[:success] = "Added favorite!"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Error saving location!"
      redirect_to locations_path
    end
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :location_id)
  end

end
