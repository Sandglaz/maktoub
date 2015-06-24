require 'spec_helper'

describe Maktoub::NewsletterMailer, :type => :controller do
  before(:each) do
    @routes = Maktoub::Engine.routes
    @mailer = Maktoub::NewsletterMailer.publish('test_template', email: 'zaid@example.com', name: 'zaid')
  end
  it "should have the right subject recipient and sender" do
    assert_equal "Test Template", @mailer.subject
    assert_equal ['maktoub@example.com'], @mailer.from # defined in dummy/config/initializers/maktoub.rb
    assert_equal ['zaid@example.com'], @mailer.to
  end

  it "should be multipart" do
    assert_equal true, @mailer.multipart?
    assert_equal false, @mailer.html_part.blank?
    assert_equal false, @mailer.text_part.blank?
  end

  it "html_part" do
    body = @mailer.html_part.body.to_s

    assert_match /View it in your browser/, body # change to link assertion
    assert_match /Copyright/, body
    assert_match /All rights reserved/, body
    assert_match /update subscription preferences/, body # change to link assertion
  end
end