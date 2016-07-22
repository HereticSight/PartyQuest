class PartiesController < ApplicationController

  before_action :set_party, only: [:show, :update, :edit, :destroy]
  before_action :current_user, only: [:create, :new]

  def show
    @party = Party.find_by(id: params[:id])
    @users = @party.parties_users
  end

  def new
    @party = current_user.parties.new
  end

  def create
    @party = current_user.parties.build(party_params)
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
  end

  def destroy
    @party.destroy
  end

  private

  def set_party
    @party = Party.find_by(params[:id])
  end

  def party_params
    params.require(:party).permit(:name)
  end

end
