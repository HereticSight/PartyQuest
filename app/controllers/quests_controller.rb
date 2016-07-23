class QuestsController < ApplicationController
  def new
    @quest = Quest.new
    login_redirect
  end

  def create
    if logged_in?
      @campaign = Campaign.find_by(id: params[:campaign_id])
      @quest = Quest.new(quest_params)
      if @quest.save
        flash[:success] = "You've created a new campaign! Add a location and start campaigning!"
        redirect_to @campaign
      else
        @errors = @quest.errors.full_messages
        flash.now[:danger] = "Something's wrong with yout campaign!"
        render 'new'
      end
    else
      redirect_to login_url
    end
  end

  private
    def quest_params
      params.require(:quest).permit(:name, :description, :price_range)
    end
end