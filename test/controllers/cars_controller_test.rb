require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
    @car = cars(:two)
  end

  test "should find car from the fixture" do
    assert Car.where("vin like ?", "00000004").length == 1
  end

  test "searches always return 200" do
    get search_cars_url, params: {search: "00000004"}
    assert_equal 200, status
  end

  test "should find 00000004" do
    get search_cars_url, params: { search: "00000004" }
    assert_select 'td', '00000004'
  end 
  
  test "shouldn't find 01" do
    get search_cars_url, params: { search: "01" }
    assert_select 'td', false
  end


  test "should get index" do
    get cars_url
    assert_response :success
  end

  test "should get new" do
    get new_car_url
    assert_response :success
  end

  test "should create car" do
    assert_difference('Car.count') do
      post cars_url, params: { car: { make_id: @car.make_id, model_id: @car.model_id, vin: @car.vin } }
    end

    assert_redirected_to car_url(Car.last)
  end

  test "should show car" do
    get car_url(@car)
    assert_response :success
  end

  test "should get edit" do
    get edit_car_url(@car)
    assert_response :success
  end

  test "should update car" do
    patch car_url(@car), params: { car: { make_id: @car.make_id, model_id: @car.model_id, vin: @car.vin } }
    assert_redirected_to car_url(@car)
  end

  test "should destroy car" do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end
end
