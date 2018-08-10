photo_urls = [
  "https://res.cloudinary.com/j163surf77/image/upload/v1533624821/cabin.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1533624851/office.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1533625210/room.jpg",
  "https://res.cloudinary.com/j163surf77/image/upload/v1533625349/kari.jpg"
]

# Admin User for forum
User.create(email: "test@test.com", password: "testtest")
User.find_by(email: 'test@test.com').update(admin: true)
User.find_by(email: 'test@test.com').update(username: "test")

# users
dirk = User.create(email: "dirk@lewagon.com", password: "testtest")
julian = User.create(email: "julian@rega-sense.ch", password: "testtest")
kevin = User.create(email: "kjsmekens@gmail.com", password: "testtest")
gus = User.create(email: "gusmac@gmail.com", password: "testtest")

# random users
random_users = []
10.times do
  random_users << User.create(email: Faker::Internet.email, password: "testest")
end

#categories
sports = Category.create(name: "Sports")
furniture = Category.create(name: "Furniture")
computers = Category.create(name: "Electronics")
# Category.create(name: "")
# Category.create(name: "")

#subcategories
surfboards = Subcategory.create(category: sports, name: "Surfboards")
gear = Subcategory.create(category: sports, name: "Gear")
bikes = Subcategory.create(category: sports, name: "Bicycles")
office = Subcategory.create(category: furniture, name: "Office")
apple = Subcategory.create(category: computers, name: "Apple")

# storage spaces
titles = ["Empty Garage", "Locked and secured barn", "empty room in my appartment", "10 square meters free storage space"]
descriptions = ["Dry, locked and a lot of space", "Room for 2 cars", "Can store anything you want. ATTENTION: My appartment is on the first floor", "Space or a couple surfboards or like."]
prices = [5, 10, 15, 7]
photos = []
addresses = ["Batu Bolong, Canggu", "Berawa Beach, North Kuta", "Seminyak, North Kuta, Bali", "Ubud, Bali" ]

titles.each_with_index do |title, index|
  StorageSpace.create(user: random_users.sample, title: title , description: descriptions[index], price_cents: prices[index], photo: photos[index], address: addresses[index])
end

# sell adverts
items = ["Bycicle", "MacBook Air 13'", "Scooter Helmet"]
description = ["Fantastic Racer. I bought the bike at the beginning of my the bootcamp and can't take it home.", "After my Lenovo would not install Linux I bought this computer. Since my company is giving me a new one I do not need it anymore.", "Bought here in Bali to have some decent protection. Couple scrates but otherwise in good condition. New price was 1.2 Mil IDR"]
photos = []
prices = [300, 1000, 40]
condition = ["used", "like new", "used"]
subcategories = [surfboards, apple, gear]
# storage_space = StorageSpace.all
address = ["Full Moon Guesthouse Canggu", "Frii Hotel Canggu", "Berawa"]

# random sell adverts
items.each_with_index do |item, index|
  SellAdvert.create(title: item, description: description[index], photo: photos[index], user: User.all.sample, price_cents: prices[index], condition: condition[index], subcategory: subcategories[index], address: address[index])
end

# buy adverts
titles = ["Looking for a Skateboard", "Protective gear for scooter", "Scuba gear", "Searching cheap MacBook for bootcamp" ]
descriptions = ["Relatively new skate or longboard to commute to boot camp", "Trying to protect myself while crusing around. Looking for gloves, helmet, and jacket", "Being an avid scooba diver I want to use the proximity to the ocean. Unfortunately I don't have my gear with me.", "I read in the forum that I should get a mac for the bootcamp."]
prices = [50, 200, 300, 600]
photos = []
subcategories = [surfboards, gear, gear, apple]
titles.each_with_index do |title, index|
  BuyAdvert.create(user: random_users.sample, title: title , description: descriptions[index], price_cents: prices[index], subcategory: subcategories[index], photo: photos[index])
end

# bookings
comments = ["Please be very careful with my things", "Will be picked up by Jack as discussed", "Make sure it does not get wet", "", "", "Thank you very much in advance!"]
start_dates = [Date.today-2, Date.today-6, Date.today-8, Date.today-10, Date.today-13]
end_dates = [Date.today+1, Date.today+4, Date.today+7, Date.today+10, Date.today+15]
status = ["confirmed", "pending", "confirmed", "pending", "confirmed", "pending", "cancelled"]
10.times do
  Booking.create(user: random_users.sample, storage_space: StorageSpace.all.sample, comment: comments.sample, start_date: start_dates.sample, end_date: end_dates.sample , status: status.sample)
end

# reviews
descriptions = ["Wonderful", "Took really good care of my stuff", "Great guy!", "Thanks a lot!", "Secure location", "Mixed experience", "It only it was always this easy"]

StorageSpace.all.each do |space|
  number_of_reviews = (3..10).to_a.sample
  number_of_reviews.times do
    Review.create(rating: [5,5,5,4,4,4,3,3,2,1].sample, description: descriptions.sample, storage_space: space)
  end
end
