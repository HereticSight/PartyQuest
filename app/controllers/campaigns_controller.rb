class CampaignsController < ApplicationController

  before_action :set_campaign, only: [:show, :update, :edit, :destroy]
  before_action :current_user, only: [:create, :new, :edit, :destroy]

  def show
    @campaign = Campaign.find_by(id: params[:id])
    @user = current_user
  end

  def new
    if @current_user
      @campaign = Campaign.new
    else
      redirect_to '/login'
    end
  end

  def create
    @campaign = @current_user.owned_campaigns.new(campaign_params)
    if @campaign.save
      flash[:success] = "You've successfully created your campaign!"
      redirect_to @campaign
    else
      @errors = @campaign.errors.full_messages
      flash[:danger] = "Oops! We couldn't create your campaign!"
      render 'new'
    end
  end

  def update
    if @campaign.update_attributes(campaign_params)
      flash[:success] = "Campaign updated!"
      redirect_to @campaign
    else
      @errors = @user.errors.full_messages
      flash.now[:danger] = "Uh oh! Something went wrong!"
      render 'campaigns/edit'
    end
  end

  def edit
    if @current_user && @current_user.id != @campaign.leader_id
      flash[:danger] = "You do not have access to this campaign."
      redirect_to campaigns_url
    end
  end

  def destroy
    if @current_user.id != @campaign.leader_id
      flash[:danger] = "You do not have access to this campaign."
      redirect_to campaigns_url
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
    params.require(:campaign).permit(:name)
  end

end
