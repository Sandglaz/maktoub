require 'spec_helper'

describe Maktoub::ArchivesController, type: :controller do
  before(:each) do
    @routes = Maktoub::Engine.routes
  end
  it 'should get show' do
    get :show
    assert_response :success
    assert_template 'newsletters/readme'
    expect(assigns(:subject)).not_to be_nil
    expect(assigns(:archive)).not_to be_nil
  end

  it 'should render the passed template' do
    get :show, newsletter: 'test_template'
    assert_template 'newsletters/test_template'
    assert_equal 'Test Template', assigns(:subject)
  end

  it 'should use the newsletter_mailer layout' do
    get :show
    assert_template 'newsletter_mailer'
  end
end
