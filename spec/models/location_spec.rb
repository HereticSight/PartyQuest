require 'rails_helper'

RSpec.describe Location, type: :model do
  let (:location) { Location.new(
                  latitude:"40.7064169",
                  longitude:"-74.0090821",
                  address:"48 Wall Street, New York, NY 10012")}

  context "#initialize" do
    it 'creates a Location object' do
      expect(location).to be_an_instance_of Location
    end
  end

  context "#latitude" do
    it "has a latitude" do
      expect(location.latitude).to eq 40.7064169
    end
  end

  context "#longitude" do
    it "has a longitude" do
      expect(location.longitude).to eq -74.0090821
    end
  end

  context "#address" do
    it "has a address" do
      expect(location.address).to eq "48 Wall Street, New York, NY 10012"
    end
  end

end
