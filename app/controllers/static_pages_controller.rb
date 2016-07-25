class StaticPagesController < ApplicationController
  def index
    @campaigns = Campaign.order(start_time: :desc).limit(5)
    render 'static_pages/index'
  end
end
