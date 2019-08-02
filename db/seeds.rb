# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Roaster
bluebottle = Roaster.create(roaster_name: "Blue Bottle", city: "Oakland", state: "CA", description: "W. James Freeman founded Blue Bottle Coffee in the early 2000s in Oakland, CA, borrowing the name from one of Europe's first cafes, The Blue Bottle Coffee House. His intention was to roast coffee in small batches (6 lbs. per roast) to sell within 24 hours of roasting, initially as a home-delivery service. Blue Bottle soon ceased deliveries and opened as a traditional cafe.", url: "https://bluebottlecoffee.com/")

sightglass = Roaster.create(roaster_name: "Sight Glass", city: "San Francisco", state: "CA", description: "Our company takes its name from the 'sightglass,' the viewing window on our vintage PROBAT coffee roaster that exposes the complex and delicate process of roasting coffee. We believe that knowing the story behind your coffee—where it was grown, how it was processed, and who handled it along the way—is a powerful link from the cup to the wider world.

Ultimately, we aim to deliver the highest quality achievable in all aspects of our business, whether that be sourcing the most beautiful and wondrous coffees attainable or employing the most mindful and quality-focused practices possible.")

# Beans
bluebottle_three = Bean.create(brand: "Three Africas", variety: "Single Origin", taste_note: "Golden raisin, winey blueberry, lemon zest", description: "Three Africas marries the radiant fruit of two coffees from Ethiopia, one washed and one natural, with the balance and authority of a washed coffee from Uganda. Each component excels on its own, but together, they traverse boundaries. No matter the brew method, this blend, which is our brightest, has good body and an approachable complexity that takes to cream well, but stands just as radiantly on its own.", organic: true, roaster_id: 1, origin_1: "Uganda")

bluebottle_donovan = Bean.create(brand: "Bella Donovan", variety: "Blend", taste_note: "Raspberry, chocolate, molasses", description: "Bella Donovan is the wool sweater of our blends—comforting, cozy, and enveloping. Our most popular blend, Bella is a variation of the archetypal Moka-Java pairing, in which a wild and jammy natural from Ethiopia finds balance with more substantive coffees from Sumatra and Peru. It stands on the darker side of things, weathers the rigors of the automatic drip machine well, and stands up to milk or cream—though it is just as elegant black.", organic: true , roaster_id: 1, origin_1: "Ethiopia", origin_2: "Sumatra", origin_3: "Peru")

sightglass_blue = Bean.create(brand: "Blueboon", variety: "Blend", taste_note: "Milk Chocolate, Mandarin, Honeysuckle", description: "This well-balanced, versatile blend celebrates simple, approachable flavors of milk chocolate, citrus, and stone fruits. We change the components seasonally, so the coffees are always fresh and the balance of sweetness, body, and acidity is just right.", organic: false, roaster_id: 2, origin_1: "Central America", origin_2: "East Africa")

# User
user1 = User.create(username: "user 1", email: "user1@test.com", password: "test")
user2 = User.create(username: "user 2", email: "user2@test.com", password: "test")
user3 = User.create(username: "user 3", email: "user3@test.com", password:"test")


# Favorite and Comments
f1 = FavoriteAndComment.create(favorite: true, comments: "I love this beans. Fresh light roast, amazing flavor.", user_id: 1, bean_id: 1)
f2 = FavoriteAndComment.create(favorite: true, comments: "Taste wondeful. Must have this coffee everyday!", user_id: 1, bean_id: 2)
f3 = FavoriteAndComment.create(favorite: false, comments: "I enjoyed raspberry taste note. Very fresh", user_id: 2, bean_id: 2)
f4 = FavoriteAndComment.create(favorite: true, comments: "Feels a bit dark but it is my favorite.", user_id: 3, bean_id: 3)
f5 = FavoriteAndComment.create(favorite: true, comments: nil, user_id: 3, bean_id: 1)
