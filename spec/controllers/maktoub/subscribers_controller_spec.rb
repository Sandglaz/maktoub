require 'spec_helper'

describe Maktoub::SubscribersController do
	describe "GET 'edit'" do
		it "should get show" do
			get :edit, :use_route => 'maktoub'
			assert_response :success
			assert_template 'subscribers/edit'
		end
	end
	
	describe "PUT 'update'" do
		before(:each) do
			@subscribers = (1..5).map do |i| 
				Subscriber.new(name: "Subscriber #{i}", email: "subscriber#{i}@example.com", newsletter: true)
			end
			Maktoub.subscribers_extractor do
				@subscribers.select { |s| s.newsletter }
			end
		end
		it "should be successful" do
			put :update, :use_route => 'maktoub', :email => 'subscriber2@example.com'
			response.should be_success
		end
		
		it "should remove the subscriber for the returned list" do
			put :update, :use_route => 'maktoub', :email => 'subscriber2@example.com'
			Maktoub.subscribers.each do |s|
				s.email.should_not == 'subscriber2@example.com'
			end
		end
		
		it "should still be successful when email doesn't exist" do
			put :update, :use_route => 'maktoub', :email => 'blablabla@example.com'
			response.should be_success
		end
		
		it "should render subscribers/unsubscribe_successful" do
			put :update, :use_route => 'maktoub', :email => 'subscriber2@example.com'
			response.should render_template 'subscribers/update'
		end
		
		it "should require an email" do
			put :update, :use_route => 'maktoub'
			response.status.should == 400
		end
	end
end