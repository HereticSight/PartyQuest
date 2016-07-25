class SearchesController < ApplicationController
  def query
      search = Search.new(params[:search])
      @campaigns = search.campaigns
      @locations = search.locations
      @users = search.users
      @query = params[:search]
      render 'show'
  end
end
