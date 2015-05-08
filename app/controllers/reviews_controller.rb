class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = "Your review was posted!"
      redirect_to location_path(@review.location_id)
    else
      flash[:danger] = @review.errors.full_messages.to_sentence
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
