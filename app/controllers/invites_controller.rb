class InvitesController < ApplicationController
  def new
    @campaign = Campaign.find_by(id: params[:campaign_id])
    @key = params[:key]
    @link = "#{campaign_invites_url(@campaign)}?key=#{@key}"
  end

  def update
    @campaign = Campaign.find_by(id: params[:campaign_id])
    unless logged_in?
      session[:forwarding_url] = "#{new_campaign_invite_url(@campaign)}?key=#{params[:key]}"
      redirect_to login_url
    end
    if @current_user && @campaign && @campaign.invite_link == params[:key]
      @campaign.users << @current_user
      if @campaign.save
        redirect_to @campaign
      else
        flash[:danger] = "Error!"
      end
    end
  end

end
