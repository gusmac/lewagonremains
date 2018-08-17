puts "destroying"
Review.destroy_all
Order .destroy_all
SellAdvert.destroy_all
BuyAdvert.destroy_all
Subcategory.destroy_all
Category.destroy_all
Booking.destroy_all
StorageSpace.destroy_all
User.destroy_all

puts "creating!"

# Admin User for forum
User.create!(email: "test@test.com", password: "testtest", first_name: "Julian", last_name: "Leopold", username: "Julian")
User.find_by(email: 'test@test.com').update(admin: true)
User.find_by(email: 'test@test.com').update(username: "test")

# users
dirk = User.create!(email: "dirk@lewagon.com", password: "testtest", first_name: "Dirk", last_name: "Schuler", username: "Dirk", phone_number: Faker::PhoneNumber.cell_phone, batch_no: 49)
julian = User.create!(email: "julian@rega-sense.ch", password: "testtest", first_name: "Julian", last_name: "Leopold", phone_number: Faker::PhoneNumber.cell_phone, batch_no: 163, username: "Julian")
kevin = User.create!(email: "kjsmekens@gmail.com", password: "testtest", first_name: "Kevin", last_name: "Smekens", phone_number: Faker::PhoneNumber.cell_phone, batch_no: 163, username: "Julian")
gus = User.create!(email: "gusmac@gmail.com", password: "testtest", first_name: "Gus", last_name: "Macfarlnae", phone_number: Faker::PhoneNumber.cell_phone, batch_no: 163, username: "Julian")

# random users
random_users = []
8.times do
  random_users << User.create!(email: Faker::Internet.email, password: "testest", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.first_name, phone_number: Faker::PhoneNumber.cell_phone, batch_no: [150,145,134,162,160].sample)
end

puts "categories"
sports = Category.create!(name: "Sports")
furniture = Category.create!(name: "Furniture")
computers = Category.create!(name: "Electronics")
# Category.create!(name: "")
# Category.create!(name: "")

puts "subcategories"
surfboards = Subcategory.create!(category: sports, name: "Surfboards")
gear = Subcategory.create!(category: sports, name: "Gear")
bikes = Subcategory.create!(category: sports, name: "Bicycles")
office = Subcategory.create!(category: furniture, name: "Office")
apple = Subcategory.create!(category: computers, name: "Apple")

puts "storage spaces"
titles = ["Big Open Empty Garage", "Locked and Secured Barn", "Empty Room for Furniture", "House by Hiking Trail"]
description = "I am renting out a room in my flat as I don't need it. The place is locked at night and barely left alone for longer than a day.
                The temperature is controlled (room temperature).
                 <ul>
                  <li>30 cubic meters</li>
                  <li>Perfect for: Boards, Instruments, Equipment</li>
                  <li>locked whenever noone is home</li>
                </ul>
                Just message me if you have questions or simply book! I am available on Whatsapp 7/7"
prices = [4, 3, 2, 5]
photos = ["https://res.cloudinary.com/j163surf77/image/upload/v1534503782/o5smycd6c7ka6gk8k7zq.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1534401066/bali_green_house_entry.jpg",
  "http://res.cloudinary.com/j163surf77/image/upload/v1534401667/egg_house.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1534507068/kimo-483327-unsplash.jpg"]
addresses = ["Batu Bolong, Canggu", "Berawa, North Kuta", "Old Mans, Bali","Ubud, Bali"]

titles.each_with_index do |title, index|
  StorageSpace.create!(user: random_users.sample, title: title , description: description, price: prices[index], address: addresses[index], remote_photo_url: photos[index])
end

dirks_space = StorageSpace.create!(user: dirk, title: "10 Square Meters for Surfboards", description: description, price: 2.5, remote_photo_url: "https://res.cloudinary.com/j163surf77/image/upload/v1534503789/er46srl2ompoctmummm8.jpg", address: "Seminyak, North Kuta")



puts "sell adverts"
items = ["Bicycle", "MacBook Pro 13'", "Scooter Helmet", "Performance Shortboard"]
description = ["Fantastic Racer. I bought the bike at the beginning of my the bootcamp and can't take it home.",
  "After my Lenovo would not install Linux I bought this computer. Since my company is giving me a new one I do not need it anymore.",
  "Bought here in Bali to have some decent protection. Couple scrates but otherwise in good condition. New price was 1.2 Mil IDR",
  "Bought a new surfboard, broke it and repaired it."]
photos = ["https://res.cloudinary.com/j163surf77/image/upload/v1534503791/szs37a9tmalyqukczrfc.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1534503793/lyvkkan6t7nvvty9hbe7.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1534503794/zqptk32ztmjnyesbbpf7.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1534503797/ligpi27x62g2lioxlfth.jpg"]
prices = [300, 1000, 400, 200, 200]
conditions = ["Used", "Like-New", "Used", "Like-New", "Used"]
subcategories = [bikes, apple, gear, gear, surfboards]
categories = [sports, computers, sports, sports, sports]
# storage_space = StorageSpace.all
address = ["Full Moon Guesthouse Canggu", "Frii Hotel Canggu", "Berawa", "Ubud", "Fullmoon Guesthouse Canggu"]

# random sell adverts
items.each_with_index do |item, index|
  b = SellAdvert.new(title: item, description: description[index], user: User.all.sample, condition: conditions[index], price: prices[index], category: categories[index], subcategory: subcategories[index], address: address[index], remote_photo_url: photos[index])
  b.save!

end

puts "buy adverts"
titles = ["Protective gear for scooter", "Scuba gear", "Searching cheap MacBook for bootcamp" ]
descriptions = ["Skate or longboard to commute to boot camp", "Trying to protect myself while crusing around. Looking for gloves, helmet, and jacket", "Being an avid scooba diver I want to use the proximity to the ocean. Unfortunately I don't have my gear with me.", "I read in the forum that I should get a mac for the bootcamp."]
prices = [200, 300, 600]
photos = ["", "https://res.cloudinary.com/j163surf77/image/upload/v1534503798/osqxajueyj1oy55f9ymx.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1534503800/kqsdi2xfngnmk1i9ljyc.jpg"]
subcategories = [gear, gear, apple]
categories = [sports, sports, computers]
titles.each_with_index do |title, index|
  b = BuyAdvert.new(user: random_users.sample, title: title , description: descriptions[index], price: prices[index], category: categories[index], subcategory: subcategories[index], remote_photo_url: photos[index])
  b.save!
end

# puts "bookings"
# comments = ["Please be very careful with my things", "Will be picked up by Jack as discussed", "Make sure it does not get wet", "", "", "Thank you very much in advance!"]
# start_dates = [Date.today-2, Date.today-6, Date.today-8, Date.today-10, Date.today-13]
# end_dates = [Date.today+1, Date.today+4, Date.today+7, Date.today+10, Date.today+15]
# status = ["Confirmed", "Pending", "Confirmed", "Pending", "Confirmed", "Pending", "Cancelled"]
# 10.times do
#   Booking.create!(user: random_users.sample, storage_space: StorageSpace.all.sample, comment: comments.sample, start_date: start_dates.sample, end_date: end_dates.sample , status: status.sample)
# end

puts "reviews"
descriptions = ["Took really good care of my stuff", "Great guy!", "I rented a unit with Extra Space Storage. When it rained the roof leaked. ", "The temperature in the storage unit was appropriate.", "These guys get you in with “specials” and then raise rates as fast as they can.", "Great and super friendly service! They explained prices and terms very clearly.", "Been renting a 10x10 storage unit for five months. Satisfied", "Our stuff were exactly as we left them and we didn't lose anything.","Extra Space raises my rent 100% without notifying me and deducts it from my charge card."]

number_of_reviews = 8
StorageSpace.all.each do |space|
  counter = 0
  number_of_reviews.times do
    r = Review.new(rating: [5,5,5,4,4,4].sample, description: descriptions[counter], storage_space: space)
    r.user = random_users[counter]
    r.save!
    counter += 1
  end
end
