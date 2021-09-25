require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get deal" do
    get static_pages_deal_url
    assert_response :success
  end
end
