require 'test_helper'

module Maktoub
  class ArchivesControllerTest < ActionController::TestCase
    test "should get show" do
      get :show, :use_route => 'maktoub'
      assert_response :success
      assert_template 'newsletters/readme'
      assert_not_nil assigns(:subject)
      assert_not_nil assigns(:archive)
    end

    test "should render the passed template" do
      get :show, :newsletter => 'test_template', :use_route => 'maktoub'
      assert_template 'newsletters/test_template'
    end

    test "should use the newsletter_mailer layout" do
      get :show, :use_route => 'maktoub'
      assert_template "newsletter_mailer"
    end
  end
end

