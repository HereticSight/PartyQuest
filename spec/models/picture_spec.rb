require 'rails_helper'

RSpec.describe Picture, type: :model do
  let (:picture) { Picture.new(
             campaign_id: 1,
             image_file_name: "default.png",
             image_content_type: "image/png",
             image_file_size: 2458
             )}

  context "#initialize" do
    it 'creates a Picture object' do
      expect(picture).to be_an_instance_of Picture
    end
  end

  context "#image" do
    it "has a image" do
      expect(picture.image).to be_truthy
    end
  end

end
