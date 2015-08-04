require 'maktoub/engine'

module Maktoub
  class << self
    attr_accessor :from,
                  :twitter_url,
                  :facebook_url,
                  :google_plus_url,
                  :linkedin_url,
                  :subscription_preferences_url,
                  :logo,
                  :home_domain,
                  :app_name,
                  :unsubscribe_method

    attr_writer :email_field, :name_field

    def email_field
      @email_field || :email
    end

    def name_field
      @name_field || :name
    end

    def subscribers
      @subscribers.call
    end

    def subscribers_extractor(&block)
      @subscribers = Proc.new &block
    end

    def unsubscribe(email)
      if Maktoub.subscribers.class.parents.include?(ActiveRecord) # check if ActiveRecord relation
        subscriber = subscribers.find_by(email_field => email)
        subscriber.send(unsubscribe_method) if subscriber.present?
      else
        puts 'WARNING!!! Use ActiveRecord query methods to find subscribers. Falling back to iterating through subscribers array (slow!).'
        subscribers.select do |s|
          s.send(email_field) == email
        end.each do |s|
          s.send(unsubscribe_method) if unsubscribe_method
        end
      end
    end

    def home_url
      'http://' + home_domain
    end
  end
end
