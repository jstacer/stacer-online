require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "should get linux_tunnel" do
    get projects_linux_tunnel_url
    assert_response :success
  end

end
