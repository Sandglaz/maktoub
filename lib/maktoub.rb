require "maktoub/engine"

module Maktoub
  class << self
    attr_accessor :from,
                  :twitter_url,
                  :facebook_url,
                  :subscription_preferences_url,
                  :logo,
                  :home_url,
                  :app_name

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

    def subscribers_extractor (&block)
      @subscribers = Proc.new block
    end
  end
end

