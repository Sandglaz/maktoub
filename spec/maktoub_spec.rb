require 'spec_helper'
require 'ostruct'

describe Maktoub do
  it "subscribers" do
    users = [OpenStruct.new({:name => 'hello', :email => 'hello@example.com'})]
    Maktoub.subscribers_extractor do
      users
    end
    Maktoub.subscribers.length.should == 1
    users << OpenStruct.new({name: "bye", email: "bye@example.com"})
    Maktoub.subscribers.length.should == 2
  end
  
  it "unsubscribe_method undefined" do
    users = (1..3).map do |i| OpenStruct.new({ :name => "hello #{i}", :email => "hello#{i}@example.com"}) end
    Maktoub.subscribers_extractor { users }
    Maktoub.subscribers.length.should == 3
    Maktoub.unsubscribe "hello2@example.com"
    Maktoub.subscribers.length.should == 2
  end
  
  it "unsubscribe_method set" do
    users = (1..3).map do |i| OpenStruct.new({ :name => "hello #{i}", :email => "hello#{i}@example.com"}) end
    Maktoub.subscribers_extractor { users }
    Maktoub.unsubscribe_method = :dummy_key
    Maktoub.subscribers.length.should == 3
    Maktoub.unsubscribe "hello2@example.com"
    Maktoub.subscribers.length.should == 2
  end

  it "email_field default value" do
    Maktoub.email_field = nil
    Maktoub.email_field.should == :email
  end

  it "name_field default value" do
    Maktoub.name_field = nil
    Maktoub.name_field.should == :name
  end

  it "custom email_field" do
    Maktoub.email_field = :address
    Maktoub.email_field.should == :address
  end

  it "custom name_field" do
    Maktoub.name_field = :first_name
    Maktoub.name_field.should == :first_name
  end

  it "configuration fields" do
    Maktoub.should respond_to :from
    Maktoub.should respond_to :twitter_url
    Maktoub.should respond_to :facebook_url
    Maktoub.should respond_to :subscription_preferences_url
    Maktoub.should respond_to :logo
    Maktoub.should respond_to :home_domain
    Maktoub.should respond_to :app_name
    Maktoub.should respond_to :unsubscribe_method
  end
end

