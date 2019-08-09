class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy, :edit, :update]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @ingredient = @cocktail.ingredients
    @dose = Dose.new
    @dose.cocktail_id = @cocktail.id
    @doses = @cocktail.doses
    @review = Review.new
    @review.cocktail_id = @cocktail.id
    @reviews = @cocktail.reviews
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktails_path
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
