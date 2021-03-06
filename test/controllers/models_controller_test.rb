require 'test_helper'

class ModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @model = models(:one)
    @model = models(:two)
  end

  test "should find model from the fixture" do
    assert Model.where("name like ?", "Model").length == 1
  end

  test "searches always return 200" do
    get search_models_url, params: {search: "Model"}
    assert_equal 200, status
  end

  test "should find Model" do
    get search_models_url, params: { search: "Model" }
    assert_select 'td', 'Model'
  end 
  
  test "shouldn't find missing model" do
    get search_models_url, params: { search: "" }
    assert_select 'td', false
  end


  test "should get index" do
    get models_url
    assert_response :success
  end

  test "should get new" do
    get new_model_url
    assert_response :success
  end

  test "should create model" do
    assert_difference('Model.count') do
      post models_url, params: { model: { make_id: @model.make_id, name: @model.name } }
    end

    assert_redirected_to model_url(Model.last)
  end

  test "should show model" do
    get model_url(@model)
    assert_response :success
  end

  test "should get edit" do
    get edit_model_url(@model)
    assert_response :success
  end

  test "should update model" do
    patch model_url(@model), params: { model: { make_id: @model.make_id, name: @model.name } }
    assert_redirected_to model_url(@model)
  end

  test "should destroy model" do
    assert_difference('Model.count', -1) do
      delete model_url(@model)
    end

    assert_redirected_to models_url
  end
end
