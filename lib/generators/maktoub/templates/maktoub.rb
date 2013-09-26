# Maktoub.from = "Test Sender <maktoub@example.com>" # the email the newsletter is sent from
# Maktoub.twitter_url = "http://twitter.com/#!/twitter" # your twitter page
# Maktoub.facebook_url = "http://www.facebook.com/facebook" # your facebook page
# Maktoub.linkedin_url = "http://www.linkedin.com/company/linkedin" # your linkedin page
# Maktoub.subscription_preferences_url = "http://example.com/manage_subscriptions" #subscribers management url
# Maktoub.logo = "logo.jpg" # path to your logo asset
# Maktoub.home_domain = "example.com" # your domain
# Maktoub.app_name = "Maktoub" # your app name
# Maktoub.unsubscribe_method = "unsubscribe" # method to call from unsubscribe link (doesn't include link by default)

# pass a block to subscribers_extractor that returns an object that  reponds to :name and :email
# (fields can be configured as shown below)

# require "ostruct"
# Maktoub.subscribers_extractor do
#   (1..5).map do |i|
#     users << OpenStruct.new({name: "tester#{i}", email: "test#{i}@example.com"})
#   end
# end

# uncomment lines below to change subscriber fields that contain email and
# Maktoub.email_field = :address
# Maktoub.name_field = :nickname
