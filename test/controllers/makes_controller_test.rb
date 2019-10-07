require 'test_helper'

class MakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @make = makes(:one)
    @make = makes(:two)
  end

  test "should find make from the fixture" do
    assert Make.where("name like ?", "Make").length == 1
  end

  test "searches always return 200" do
    get search_makes_url, params: {search: "Make"}
    assert_equal 200, status
  end

  test "should find Make" do
    get search_makes_url, params: { search: "Make" }
    assert_select 'td', 'Make'
  end 
  
  test "shouldn't find missing make" do
    get search_cars_url, params: { search: "" }
    assert_select 'td', false
  end


  test "should get index" do
    get makes_url
    assert_response :success
  end

  test "should get new" do
    get new_make_url
    assert_response :success
  end

  test "should create make" do
    assert_difference('Make.count') do
      post makes_url, params: { make: { country: @make.country, name: @make.name } }
    end

    assert_redirected_to make_url(Make.last)
  end

  test "should show make" do
    get make_url(@make)
    assert_response :success
  end

  test "should get edit" do
    get edit_make_url(@make)
    assert_response :success
  end

  test "should update make" do
    patch make_url(@make), params: { make: { country: @make.country, name: @make.name } }
    assert_redirected_to make_url(@make)
  end

  test "should destroy make" do
    assert_difference('Make.count', -1) do
      delete make_url(@make)
    end

    assert_redirected_to makes_url
  end
end
