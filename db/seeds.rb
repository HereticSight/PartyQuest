User.create!(first_name:"Joseph",
             last_name:"Johnson",
             username:"joejohn",
             email:"joe@john.com",
             password:"P@ssword1",
             password_confirmation:"P@ssword1")

User.create!(first_name:"Mary",
            last_name:"Johnson",
            username:"maryjohn",
            email:"mary@john.com",
            password:"P@ssword1",
            password_confirmation:"P@ssword1")


party = Party.create(name:"PoopyQuesters",
              leader_id: User.first.id)

User.all.each do |user|
  party.users << user
  party.save
end

Location.create!(address: "123 Fake St", city:"New York", state:"NY")

Activity.create!(name:"Eat 8 Jalapeno poppers", description:"Down those poppers", price_range:2)

quest = Quest.new(name:'PoopyQuest', location_id: 1, party_id: 1, start_time: Time.now)
quest.activities = Activity.all
quest.save
