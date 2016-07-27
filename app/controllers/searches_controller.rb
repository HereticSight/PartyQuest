class SearchesController < ApplicationController
  def query
      search = Search.new(params[:search])
      @campaigns = search.campaigns
      @users = search.users
      render 'show'
  end
end
