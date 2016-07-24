class LocationsController < ApplicationController

   before_action :current_user, only: [:create, :new, :edit, :destroy]

  def index
    @locations = Location.all
  end

  def show
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @location = @campaign.location
  end

  def new
    if @current_user
      @campaign = Campaign.find_by(id: params[:campaign_id])
      if @current_user.id == @campaign.leader_id
        @location = @campaign.build_location
      else
        redirect_to @campaign
      end
    else
      redirect_to '/login'
    end
  end

  def create
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @location = Location.find_or_initialize_by(location_params)
    if @location.save
      flash[:success] = "You've successfully created your location!"
      @campaign.location = @location
      @campaign.save
      redirect_to new_campaign_quest_path(@campaign)
    else
      @errors = @location.errors.full_messages
      flash[:danger] = "Oops! We couldn't create your location!"
      render 'new'
    end
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude, :address, :city, :state, :campaign_id)
  end
end
