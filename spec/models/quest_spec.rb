require 'rails_helper'

RSpec.describe Quest, type: :model do
  let (:quest) { Quest.new(
             name:"Eat 8 Jalapeno poppers",
             description:"Down those poppers",
             price_range:2,
             )}

  context "#initialize" do
    it 'creates a Quest object' do
      expect(quest).to be_an_instance_of Quest
    end
  end

  context "#name" do
    it "has a name" do
      expect(quest.name).to eq "Eat 8 Jalapeno poppers"
    end
  end

  context "#description" do
    it "has a description" do
      expect(quest.description).to eq "Down those poppers"
    end
  end

  context "#price_range" do
    it "has a price range" do
      expect(quest.price_range).to eq 2
    end
  end

end
