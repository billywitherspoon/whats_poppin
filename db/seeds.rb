#create 10 users (faker names)
10.times do
  User.create(
     first_name: Faker::Name.first_name,
     last_name: Faker::Name.last_name,
     email: Faker::Internet.free_email,
     password: Faker::Internet.password,
     phone_number: Faker::PhoneNumber.cell_phone
  )
end

#create 10 neighborhoods (faker countries)
10.times do
   Neighborhood.create(
      name: Faker::TvShows::GameOfThrones.city
   )
end 

#create 10 venues (faker companies)
10.times do
   Venue.create(
      name: Faker::Company.name,
      neighborhood: Neighborhood.all.sample,
      capacity: rand(100..250)
   )
end 

#create 10 events (faker nebulas)
10.times do
   Event.create(
      name: Faker::Internet.domain_word,
      venue: Venue.all.sample,
      line_length: rand(0..50),
      entry_cost: rand(0..50),
      start_time: Faker::Time.forward(1, :evening)
   )
end 

#create 3 checkins for each user
User.all.each do |user| 
   3.times do
      CheckIn.create(
         user: user,
         event: Event.all.sample,
         rating: rand(1..5),
         comment: Faker::Hipster.paragraph
      )
   end
end 
