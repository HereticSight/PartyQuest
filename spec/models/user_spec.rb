require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { User.new(
             first_name:"Joseph",
             last_name:"Johnson",
             username:"joejohn4",
             email:"joe4@john.com",
             password:"P@ssword1",
             password_confirmation:"P@ssword1",
             avatar_file_name: "default.png",
             avatar_content_type: "image/png",
             avatar_file_size: 2458
             )}

  context "#initialize" do
    it 'creates a User object' do
      expect(user).to be_an_instance_of User
    end
  end

  context "#first_name" do
    it "has a first name" do
      expect(user.first_name).to eq "Joseph"
    end
  end

  context "#last_name" do
    it "has a last name" do
      expect(user.last_name).to eq "Johnson"
    end
  end

  context "#username" do
    it "has a username" do
      expect(user.username).to eq "joejohn4"
    end
  end

  context "#email" do
    it "has a email" do
      expect(user.email).to eq "joe4@john.com"
    end
  end

  context "#password" do
    it "has a password" do
      expect(user.password).to eq "P@ssword1"
    end
  end

  context "#avatar" do
    it "has a avatar" do
      expect(user.avatar).to be_truthy
    end
  end

end
