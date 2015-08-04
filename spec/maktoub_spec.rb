require 'spec_helper'
require 'ostruct'

describe Maktoub do
  it 'subscribers' do
    users = [OpenStruct.new(name: 'hello', email: 'hello@example.com')]
    Maktoub.subscribers_extractor do
      users
    end
    expect(Maktoub.subscribers.length).to eql 1
    users << OpenStruct.new(name: 'bye', email: 'bye@example.com')
    expect(Maktoub.subscribers.length).to eql 2
  end

  it 'unsubscribe_method' do
    users = (1..3).map do |i|
      OpenStruct.new(name: "hello #{i}", email: "hello#{i}@example.com")
    end
    Maktoub.subscribers_extractor { users }
    Maktoub.unsubscribe_method = :dummy_unsubscribe
    expect(Maktoub.subscribers.length).to eql 3
    expect_any_instance_of(OpenStruct).to receive(:dummy_unsubscribe)
    Maktoub.unsubscribe 'hello2@example.com'
  end

  it 'email_field default value' do
    Maktoub.email_field = nil
    expect(Maktoub.email_field).to eql :email
  end

  it 'name_field default value' do
    Maktoub.name_field = nil
    expect(Maktoub.name_field).to eql :name
  end

  it 'custom email_field' do
    Maktoub.email_field = :address
    expect(Maktoub.email_field).to eql :address
  end

  it 'custom name_field' do
    Maktoub.name_field = :first_name
    expect(Maktoub.name_field).to eql :first_name
  end

  it 'configuration fields' do
    expect(Maktoub).to respond_to :from
    expect(Maktoub).to respond_to :twitter_url
    expect(Maktoub).to respond_to :facebook_url
    expect(Maktoub).to respond_to :subscription_preferences_url
    expect(Maktoub).to respond_to :logo
    expect(Maktoub).to respond_to :home_domain
    expect(Maktoub).to respond_to :app_name
    expect(Maktoub).to respond_to :unsubscribe_method
  end
end
