require "ostruct"

Maktoub.from = "Test Sender <maktoub@example.com>"
Maktoub.twitter_url = "http://twitter.com/#!/twitter"
Maktoub.facebook_url = "http://www.facebook.com/facebook"
Maktoub.google_plus_url = "https://plus.google.com/101560853443212199687"
Maktoub.subscription_preferences_url = "http://example.com/manage_subscriptions"
Maktoub.logo = "logo.jpg"
Maktoub.home_domain = "example.com"
Maktoub.app_name = "Dummy application"

Maktoub.subscribers_extractor do
  users = []
  (1..5).each do |i|
    users << OpenStruct.new({name: "tester#{i}", email: "test#{i}@example.com"})
  end
  users
end

