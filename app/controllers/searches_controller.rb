class SearchesController < ApplicationController
  def query
      search = Search.new(params[:search])
      @campaigns = search.campaigns
      @location_campaigns = search.location_campaigns
      @users = search.users
      render 'show'

  end
end
