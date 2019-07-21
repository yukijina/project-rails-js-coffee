# Rails/JavaScript Project

## Model  
user
roaster
bean
review_and_favorite

### User
has_many :review_and_favorites
has_many :beans, through: :review_and_favorites
has_many :roasters, through: :beans
username
email
password

## Roaster
has_many :beans
has_many :users, through: :beans
roaster_name
city
state
description
url

## Beans
belongs_to :roaster
has_many :review_and_favorites
has_many :users, through: :review_and_favorites
has_many :locations
brand
variety (blended/single origin/espresso)
taste_note
description
organic (boolean)
fairtrade (boolean)
roaster_id
location (nested)
(roast_profile (medium/dark..))
(type)
(processing_method)
(size)
(price)
image (will tray later with active storage?)

# Location
has_one :bean
location_1
location_2
location_3

## review_and_favorite
belongs_to :user
belong_to :bean
like
rating
comments
user_id
bean_id
