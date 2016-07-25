class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def show
    @location = Location.find_by(id: params[:id])
  end

  def new
    login_redirect
    @campaign = Campaign.find_by(id: params[:campaign_id])
    if current_user?(@campaign.leader)
      @location = @campaign.build_location
    else
      redirect_to @campaign
    end
  end

  def create
    @campaign = Campaign.find_by(id: params[:campaign_id])
    binding.pry
    @location = Location.find_by(address:location_params[:raw_address]) || Location.find_by(latitude: location_params[:latitude], longitude: location_params[:longitude]) || Location.new(location_params)

    login_redirect
    if current_user?(@campaign.leader)
      if @campaign.location.present?
        if @location.save
          flash[:success] = "You've successfully created a location!"
          @campaign.location = @location
          @campaign.save
          redirect_to @campaign
        else
          @errors = @location.errors.full_messages
          flash[:danger] = "Oops! We couldn't create your location!"
          render 'new'
        end
      else
        if @location.save
          flash[:success] = "You've successfully created a location!"
          @campaign.location = @location
          @campaign.save
          redirect_to new_campaign_quest_path(@campaign)
        else
          @errors = @location.errors.full_messages
          flash[:danger] = "Oops! We couldn't create your location!"
          render 'new'
        end
      end
    else
      redirect_to @campaign
    end
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude, :raw_address, :campaign_id)
  end
end
