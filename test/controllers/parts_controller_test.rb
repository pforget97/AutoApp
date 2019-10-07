require 'test_helper'

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part = parts(:one)
    @part = parts(:two)
  end

  test "should find part from the fixture" do
    assert Part.where("name like ?", "Part").length == 1
  end

  test "searches always return 200" do
    get search_parts_url, params: {search: "Part"}
    assert_equal 200, status
  end

  test "should find part" do
    get search_parts_url, params: { search: "Part" }
    assert_select 'td', 'Part'
  end 
  
  test "shouldn't find missing part" do
    get search_part_url, params: { search: "" }
    assert_select 'td', false
  end


  test "should get index" do
    get parts_url
    assert_response :success
  end

  test "should get new" do
    get new_part_url
    assert_response :success
  end

  test "should create part" do
    assert_difference('Part.count') do
      post parts_url, params: { part: { name: @part.name } }
    end

    assert_redirected_to part_url(Part.last)
  end

  test "should show part" do
    get part_url(@part)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_url(@part)
    assert_response :success
  end

  test "should update part" do
    patch part_url(@part), params: { part: { name: @part.name } }
    assert_redirected_to part_url(@part)
  end

  test "should destroy part" do
    assert_difference('Part.count', -1) do
      delete part_url(@part)
    end

    assert_redirected_to parts_url
  end
end
