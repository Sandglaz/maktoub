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
                  :unsubscribe_method,
                  :template_data

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
      @subscribers = block
    end

    def home_url
      'http://' + home_domain
    end

    def unsubscribe(email)
      # check if ActiveRecord relation
      if Maktoub.subscribers.class.parents.include?(ActiveRecord)
        run_with_active_record(email)
      else
        Rails.logger.warn 'Use ActiveRecord query methods to find subscribers.'\
             'Falling back to iterating through subscribers array (slow!).'

        run_with_array(email)
      end
    end



    protected

    def run_with_active_record(email)
      subscriber = subscribers.find_by(email_field => email)
      subscriber.send(unsubscribe_method) if subscriber.present?
    end

    def run_with_array(email)
      selected = subscribers.select { |s| s.send(email_field) == email }
      selected.each { |s| s.send(unsubscribe_method) if unsubscribe_method }
    end
  end
end
