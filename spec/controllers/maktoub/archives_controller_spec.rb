require 'spec_helper'

describe Maktoub::ArchivesController do
  it "should get show" do
    get :show, :use_route => 'maktoub'
    assert_response :success
    assert_template 'newsletters/readme'
    assert_not_nil assigns(:subject)
    assert_not_nil assigns(:archive)
  end

  it "should render the passed template" do
    get :show, :newsletter => 'test_template', :use_route => 'maktoub'
    assert_template 'newsletters/test_template'
    assert_equal 'Test Template', assigns(:subject)
  end

  it "should use the newsletter_mailer layout" do
    get :show, :use_route => 'maktoub'
    assert_template "newsletter_mailer"
  end
end