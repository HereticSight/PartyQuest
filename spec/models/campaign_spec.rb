require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let (:campaign) { Campaign.new(
                  name:"Food",
                  leader_id:1,
                  invite_link: "AF2C0jhFsIEDAZMJ1AKPxQ",
                  start_time:"Mon, 04 Apr 44444 04:44:00 UTC +00:00",
                  end_time: "Thu, 05 May 55555 05:55:00 UTC +00:00",
                  location_id: 1)}

  context "#initialize" do
    it 'creates a Campaign object' do
      expect(campaign).to be_an_instance_of Campaign
    end
  end

  context "#name" do
    it "has a name" do
      expect(campaign.name).to eq "Food"
    end
  end

  context "#leader_id" do
    it "has a leader id" do
      expect(campaign.leader_id).to eq 1
    end
  end

  context "#start_time" do
    it "has a start time" do
      expect(campaign.start_time).to eq "Mon, 04 Apr 44444 04:44:00 UTC +00:00"
    end
  end

  context "#end_time" do
    it "has a end time" do
      expect(campaign.end_time).to eq "Thu, 05 May 55555 05:55:00 UTC +00:00"
    end
  end

  context "#location_id" do
    it "has a location id" do
      expect(campaign.location_id).to eq 1
    end
  end

  context "#invite_link" do
    it "has a invite link" do
      expect(campaign.invite_link).to eq "AF2C0jhFsIEDAZMJ1AKPxQ"
    end
  end

end
