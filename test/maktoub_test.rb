require 'test_helper'

class MaktoubTest < ActiveSupport::TestCase
  test "subscribers" do
    users = [{:name => 'hello', :email => 'hello@example.com'}]
    Maktoub.subscribers_extractor do
      users
    end
    assert_equal 1, Maktoub.subscribers.length
    users << {name: "bitch", email: "bitch@example.com"}
    assert_equal 2, Maktoub.subscribers.length
  end
end

