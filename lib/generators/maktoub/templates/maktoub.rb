# The email the newsletter is sent from:
# Maktoub.from = 'Test Sender <maktoub@example.com>'
# Your Twitter page:
# Maktoub.twitter_url = 'http://twitter.com/#!/twitter'
# Your facebook page:
# Maktoub.facebook_url = 'http://www.facebook.com/facebook'
# Your Linkedin page:
# Maktoub.linkedin_url = 'http://www.linkedin.com/company/linkedin'
# Subscribers management url:
# Maktoub.subscription_preferences_url = 'http://example.com/manage_subscriptions'
# Path to your logo asset:
# Maktoub.logo = 'logo.jpg'
# Your domain:
# Maktoub.home_domain = 'example.com'
# Your app name:
# Maktoub.app_name = 'Maktoub'
# Method to call from unsubscribe link (doesn't include link by default):
# Maktoub.unsubscribe_method = 'unsubscribe'

# Pass a block to subscribers_extractor that returns an object that responds to:
# :name and :email (fields can be configured as shown below)

# require 'ostruct'
# Maktoub.subscribers_extractor do
#   (1..5).map do |i|
#     users << OpenStruct.new({name: "tester#{i}", email: "test#{i}@example.com"})
#   end
# end

# Uncomment these lines below to change subscriber fields that contains
# email and name:
# Maktoub.email_field = :address
# Maktoub.name_field = :nickname
