require 'test_helper'

class BlackjackControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get blackjack_get_url
    assert_response :success
  end

  test "should get post" do
    get blackjack_post_url
    assert_response :success
  end

end
