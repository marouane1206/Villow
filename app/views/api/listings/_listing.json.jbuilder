json.extract! listing,
              :id,
              :price,
              :bedroom,
              :bathroom,
              :sqmt,
              :address,
              :city,
              :state,
              :zipcode,
              :listing_type,
              :est_payment,
              :building_type,
              :built_in,
              :heating,
              :ac,
              :garage,
              :price_sqmt,
              :overview,
              :key_words,
              :views,
              :owner_id,
              :created_at,
              :lat,
              :lng,
              :updated_at,
              :created_at

# Attach key photo_urls with value array of image urls to listing
json.photo_urls listing.photos.map { |file| rails_blob_url(file) }

# Attach key favorite to listing if current user is signed in and has favorited
# the listing
json.favorite listing.favoriter.exists?(id: current_user.id) if current_user
