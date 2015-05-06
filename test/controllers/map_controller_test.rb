require 'test_helper'

class MapControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
    assert_select 'h1', 'Мои карты'
  end

  test 'should get create page' do
    get :create
    assert_response :success
    assert_select 'h1', 'Добавление карты'
    assert '[name="map_name"]'
    assert_empty '[name="map_name"][value=?]', 'Map name should be empty in create form'
  end
end
