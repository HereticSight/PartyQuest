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
    # ^^^ used the helper methods to simplify code
    # if @current_user
    #   @campaign = Campaign.find_by(id: params[:campaign_id])
    #   if @current_user.id == @campaign.leader_id
    #     @location = @campaign.build_location
    #   else
    #     redirect_to @campaign
    #   end
    # else
    #   redirect_to '/login'
    # end
  end

  def create
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @location = Location.find_or_initialize_by(location_params)
    login_redirect
    if current_user?(@campaign.leader)
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
    else
      redirect_to @campaign
    end
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude, :address, :city, :state, :campaign_id)
  end
end
