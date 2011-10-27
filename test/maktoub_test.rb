require 'test_helper'
require 'ostruct'

class MaktoubTest < ActiveSupport::TestCase
  test "subscribers" do
    users = [OpenStruct.new({:name => 'hello', :email => 'hello@example.com'})]
    Maktoub.subscribers_extractor do
      users
    end
    assert_equal 1, Maktoub.subscribers.length
    users << OpenStruct.new({name: "bitch", email: "bitch@example.com"})
    assert_equal 2, Maktoub.subscribers.length
  end

  test "email_field default value" do
    Maktoub.email_field = nil
    assert_equal :email, Maktoub.email_field
  end

  test "name_field default value" do
    Maktoub.name_field = nil
    assert_equal :name, Maktoub.name_field
  end

  test "custom email_field" do
    Maktoub.email_field = :address
    assert_equal :address, Maktoub.email_field
  end

  test "custom name_field" do
    Maktoub.name_field = :first_name
    assert_equal :first_name, Maktoub.name_field
  end

  test "configuration fields" do
    assert_respond_to Maktoub, :from
    assert_respond_to Maktoub, :twitter_url
    assert_respond_to Maktoub, :facebook_url
    assert_respond_to Maktoub, :subscription_preferences_url
    assert_respond_to Maktoub, :logo
    assert_respond_to Maktoub, :home_domain
    assert_respond_to Maktoub, :app_name
  end
end

