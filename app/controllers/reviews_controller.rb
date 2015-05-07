class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to locations_path
    else
      render 'new'
    end
  end

  def show
    @review = Review.find(params[:id])
  end


  private

  def review_params
    params.require(:review).permit(:rating, :photo, :content, :user_id, :location_id)
  end

end
