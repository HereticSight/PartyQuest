class CampaignsController < ApplicationController

  before_action :set_campaign, only: [:show, :update, :edit, :destroy]

  def show
    @campaign = Campaign.find_by(id: params[:id])
    @quests = @campaign.quests
    @link = invite_url
    @members = @campaign.users
  end

  def new
    login_redirect
    @campaign = Campaign.new
  end

  def create
    login_redirect
    @campaign = @current_user.created_campaigns.new(campaign_params)
    if @campaign.save
      @campaign.users << @current_user
      @campaign.save
      flash[:success] = "You've successfully created your campaign!"
      redirect_to new_campaign_location_path(@campaign)
    else
      @errors = @campaign.errors.full_messages
      flash[:danger] = "Oops! We couldn't create your campaign!"
      render 'new'
    end
  end

  def update
    if current_user?(@campaign.leader)
      if @campaign.update_attributes(campaign_params)
        flash[:success] = "Campaign updated!"
        redirect_to @campaign
      else
        @errors = @campaign.errors.full_messages
        flash.now[:danger] = "Uh oh! Something went wrong!"
        render 'campaigns/edit'
      end
    else
      flash[:danger] = "You do not have access to this campaign."
      redirect_to root_url
    end
  end

  def edit
    if !current_user?(@campaign.leader)
      flash[:danger] = "You do not have access to this campaign."
      redirect_to root_url
    end
  end

  def destroy
    if !current_user?(@campaign.leader)
      flash[:danger] = "You do not have access to this campaign."
      redirect_to root_url
    else
      @campaign.destroy
      flash[:success] = "Campaign deleted."
      redirect_to root_url
    end
  end

  private

  def set_campaign
    @campaign = Campaign.find_by(id: params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:name, :start_time, :end_time)
  end

  def invite_url
    "#{new_campaign_invite_url(@campaign)}?key=#{@campaign.invite_link}"
  end
end
