require 'test_helper'

class CatalogControllerTest < ActionController::TestCase
  setup do
    @one = categories(:one)
    @two = categories(:two)
    @three = categories(:three)
    @four = categories(:empty)

    @iphone = products(:iphone)
    @ipad = products(:ipad)
    @mouse = products(:mouse)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
    assert_not_nil assigns(:products)
    assert_includes assigns(:categories), @one
    assert_includes assigns(:categories), @two
    assert_includes assigns(:categories), @three
    assert_not_includes assigns(:categories), @four
  end

  test "should post index for search" do
    post :index, categories: [@three]
    assert_response :success
    assert_not_nil assigns(:categories)
    assert_not_nil assigns(:products)

    assert_includes assigns(:products), @mouse
    assert_not_includes assigns(:products), @iphone
    assert_not_includes assigns(:products), @ipad
  end
end
