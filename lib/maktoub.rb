require "maktoub/engine"

module Maktoub
  class << self
    attr_accessor :from, :twitter_url, :facebook_url, :subscription_preferences_url, :logo, :home_url, :app_name

    def subscribers
      @subscribers.call
    end

    def subscribers_extractor (&block)
      @subscribers = Proc.new block
    end
  end
end

