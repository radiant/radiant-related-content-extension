require File.dirname(__FILE__) + '/../test_helper'

class AutocompleteTest < Test::Unit::TestCase
  test_helper :login
  
  def setup
    @controller = Admin::PageController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
    login_as :existing
  end

  def test_should_have_related_action
    assert_respond_to @controller, :related
  end

  def test_should_render_list_of_matching_pages
    get :related, :related_content => "doc"
    assert_response :success
    assert_tag :li, :attributes => {:id => /2/}, :content => /#{pages(:documentation).title}/
    assert_no_tag :body # no layout!
  end
end
