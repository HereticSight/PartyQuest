class QuestsController < ApplicationController
  def new
    @campaign = Campaign.find_by(id: params[:campaign_id])
    if @campaign == nil
      redirect_to root_url
      flash[:danger] = "This campaign doesn't exist!"
    else
      redirect_to @campaign unless @campaign.leader == @current_user
      if request.xhr?
        @quest = Quest.new
        render partial: "quests/form", locals: { campaign: @campaign, quest: @quest } 
      else
        @quest = Quest.new
      end
    end
    login_redirect
  end

  def create
    login_redirect
    @campaign = Campaign.find_by(id: params[:campaign_id])
    redirect_to @campaign unless @campaign.leader == @current_user
    @quest = @campaign.quests.build(quest_params)
    if request.xhr?
      if @quest.save
        @campaign.quests << @quest
        render partial: "quests/quest", locals: { campaign: @campaign, quest: @quest, current_user: @current_user }
      end
    else
      if @quest.save
        @campaign.quests << @quest
        flash[:success] = "You've added a new quest! Add some more or gear up and get out there!"
        redirect_to @campaign
      else
        @errors = @quest.errors.full_messages
        flash.now[:danger] = "Something's wrong with your quest!"
        render 'new'
      end
    end
  end

  def destroy
    @campaign = Campaign.find_by(id: params[:campaign_id])
    login_redirect
    if @current_user == @campaign.leader
      @quest = Quest.find_by(id: params[:id])
      @quest.destroy
      flash[:success] = "You've successfully removed a quest."
      redirect_to @campaign
    else
      flash[:danger] = "You cannot delete this quest."
      redirect_to @campaign
    end

  end

  private
    def quest_params
      params.require(:quest).permit(:name, :description, :price_range)
    end
end
