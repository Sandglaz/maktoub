require 'spec_helper'

module Maktoub
  describe SubscribersController, type: :controller do
    before(:each) do
      @routes = Engine.routes
    end

    describe "GET 'edit'" do
      it 'should get show' do
        get :edit

        assert_response :success
        assert_template 'subscribers/edit'
      end
    end

    describe "PUT 'update'" do
      before(:each) do
        @subscribers = (1..5).map do |i|
          Subscriber.new name: "Subscriber #{i}",
                         email: "subscriber#{i}@example.com",
                         newsletter: true
        end

        Maktoub.subscribers_extractor do
          @subscribers.select(&:newsletter)
        end
      end
      it 'should be successful' do
        put :update, email: 'subscriber2@example.com'

        expect(response).to be_success
      end

      it 'should remove the subscriber for the returned list' do
        put :update, email: 'subscriber2@example.com'

        Maktoub.subscribers.each do |s|
          expect(s.email).not_to eql 'subscriber2@example.com'
        end
      end

      it "should still be successful when email doesn't exist" do
        put :update, email: 'blablabla@example.com'

        expect(response).to be_success
      end

      it 'should render subscribers/unsubscribe_successful' do
        put :update, email: 'subscriber2@example.com'

        expect(response).to render_template 'subscribers/update'
      end

      it 'should require an email' do
        put :update

        expect(response.status).to eql 400
      end
    end
  end
end
