class PartiesController < ApplicationController

  before_action :set_party, only: [:show, :update, :edit, :destroy]
  before_action :current_user, only: [:create, :new, :edit, :destroy]

  def show
    @party = Party.find_by(id: params[:id])
    @user = current_user
  end

  def new
    @party = Party.new
  end

  def create
    @party = @current_user.owned_parties.new(party_params)
    if @party.save
      flash[:success] = "You've successfully created your party!"
      redirect_to @party
    else
      @errors = @party.errors.full_messages
      flash[:danger] = "Oops! We couldn't create your party!"
      render 'new'
    end
  end

  def update
    if @party.update_attributes(party_params)
      flash[:success] = "Party updated!"
      redirect_to @party
    else
      @errors = @user.errors.full_messages
      flash.now[:danger] = "Uh oh! Something went wrong!"
      render 'parties/edit'
    end
  end

  def edit
    if @current_user.id != @party.leader_id
      flash[:danger] = "You do not have access to this party."
      redirect_to parties_url
    end
  end

  def destroy
    if @current_user.id != @party.leader_id
      flash[:danger] = "You do not have access to this party."
      redirect_to parties_url
    else
      @party.destroy
      flash[:success] = "Party deleted."
      redirect_to root_url
    end
  end

  private

  def set_party
    @party = Party.find_by(id: params[:id])
  end

  def party_params
    params.require(:party).permit(:name)
  end

end
