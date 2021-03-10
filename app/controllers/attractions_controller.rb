class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :new, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new(attraction_id: @attraction.id, user_id: current_user.id)
  end

  def new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'attractions/new'
    end
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end

  def set_attraction
    @attraction = (Attraction.find_by(id: params[:id]) || Attraction.new)
  end
end