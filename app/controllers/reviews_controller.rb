class ReviewsController < ApplicationController
  def show
    @reviews = Review.all
  end

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.cocktail = Cocktail.find(params[:cocktail_id])
    @review.save
    redirect_to cocktail_path(@review.cocktail)
  end

  private

  def review_params
    params.require(:review).permit(:user_name, :description, :star)
  end
end
