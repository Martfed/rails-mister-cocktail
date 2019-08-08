class DosesController < ApplicationController
  before_action :set_dose, only: [ :show, :destroy, :edit, :update ]
  def index
  end

  def new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save
    redirect_to cocktail_path(@dose.cocktail)
  end

  def edit
  end

  private

  def set_dose
    @dose = dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:amount, :description, :ingredient_id)
  end
end
