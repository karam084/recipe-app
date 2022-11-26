require 'test_helper'

class FoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food = @foods
  end

  test 'should get index' do
    sign_in users(:rathod)
    get foods_url
    assert_response :success
  end
end
