class Search
  attr_reader :users, :campaigns, :location_campaigns, :search

  def initialize(args)
    @search = args.split("/\s+/")
    @users = []
    @campaigns = []
    @location_campaigns = []

    user_results = PgSearch.multisearch(args).where(:searchable_type => "User")
    campaign_results = PgSearch.multisearch(args).where(:searchable_type => "Campaign")
    location_results = PgSearch.multisearch(args).where(:searchable_type => "Location")

    user_results.each do |user|
      @users << User.find_by(id: user.searchable_id)
    end

    campaign_results.each do |campaign|
      @campaigns << Campaign.find_by(id: campaign.searchable_id)
    end

    location_results.each do |location|
      @location_campaigns << Campaign.find_by(location_id: location.searchable_id)
    end

    if @search.length > 1
      self.users_search
      self.campaigns_search
      self.location_campaigns_search
    end
  end

  def users_search
    @search.each do |word|
      users = PgSearch.multisearch(term).where(:searchable_type => "User")
      users.each do |user|
        @users << User.find_by(id: user.searchable_id)
      end
    end
  end

    def campaigns_search
    @search.each do |word|
      campaigns = PgSearch.multisearch(term).where(:searchable_type => "Campaign")
      campaigns.each do |campaign|
        @campaigns << Recipe.find_by(id: campaign.searchable_id)
      end
    end
  end

  def location_campaigns_search
    @search.each do |word|
      locations = PgSearch.multisearch(term).where(:searchable_type => "Location")
      locations.each do |location|
          @location_campaigns << Campaign.find_by(location_id: matching_location.searchable_id)
      end
    end
  end
end
