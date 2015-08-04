require 'spec_helper'

module Maktoub
  describe NewsletterMailer, type: :controller do
    before(:each) do
      @routes = Engine.routes
      @mailer = NewsletterMailer.publish 'test_template',
                                         email: 'zaid@example.com',
                                         name: 'zaid'
    end

    it 'should have the right subject recipient and sender' do
      assert_equal 'Test Template', @mailer.subject
      # defined in dummy/config/initializers/maktoub.rb
      assert_equal ['maktoub@example.com'], @mailer.from
      assert_equal ['zaid@example.com'], @mailer.to
    end

    it 'should be multipart' do
      assert_equal true, @mailer.multipart?
      assert_equal false, @mailer.html_part.blank?
      assert_equal false, @mailer.text_part.blank?
    end

    it 'html_part' do
      body = @mailer.html_part.body.to_s

      # change to link assertion
      assert_match(/View it in your browser/, body)
      assert_match(/Copyright/, body)
      assert_match(/All rights reserved/, body)
      # change to link assertion
      assert_match(/update subscription preferences/, body)
    end
  end
end
