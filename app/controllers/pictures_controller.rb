class PicturesController < ApplicationController
  def new
    @campaign = Campaign.find_by(id: params[:campaign_id]) || not_found
    redirect_to @campaign unless @campaign.leader == @current_user || @campaign.users.include?(@current_user)
    @picture = Picture.new
    login_redirect
  end

  def create
    login_redirect
    @campaign = Campaign.find_by(id: params[:campaign_id])
    redirect_to @campaign unless @campaign.leader == @current_user || @campaign.users.include?(@current_user)
    @picture = @campaign.pictures.build(picture_params)
    if @picture.save
      @campaign.pictures << @picture
      flash[:success] = "You've added a new picture!"
      redirect_to @campaign
    else
      @errors = @picture.errors.full_messages
      flash.now[:danger] = "Something's wrong with your picture!"
      render 'new'
    end
  end

  def destroy
    @campaign = Campaign.find_by(id: params[:campaign_id])
    login_redirect
    if @current_user == @campaign.leader
      @picture = Picture.find_by(id: params[:id])
      @picture.destroy
      flash[:success] = "You've successfully removed a picture."
      redirect_to @campaign
    else
      flash[:danger] = "You cannot delete this picture."
      redirect_to @campaign
    end

  end

  private
    def picture_params
      params.require(:picture).permit(:image)
    end
end
