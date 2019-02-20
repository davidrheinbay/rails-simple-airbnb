class FlatsController < ApplicationController
  before_action :set_flat, only: %i[edit update show destroy]

  def index
    if params[:search].nil?
    @flats = Flat.all
    else
    @flats = Flat.where("name LIKE '%#{params[:search]}%'")
    end
  end

  def new
    @flat = Flat.new
  end

  def show; end

  def create
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @flat.update(flat_params)
      redirect_to flats_path
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :number_of_guests, :price_per_night)
  end

  def set_flat
  @flat = Flat.find(params[:id])
  end

end
