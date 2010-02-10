require 'test_helper'

class LocalitiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:localities)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_locality
    assert_difference('Locality.count') do
      post :create, :locality => { }
    end

    assert_redirected_to locality_path(assigns(:locality))
  end

  def test_should_show_locality
    get :show, :id => localities(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => localities(:one).id
    assert_response :success
  end

  def test_should_update_locality
    put :update, :id => localities(:one).id, :locality => { }
    assert_redirected_to locality_path(assigns(:locality))
  end

  def test_should_destroy_locality
    assert_difference('Locality.count', -1) do
      delete :destroy, :id => localities(:one).id
    end

    assert_redirected_to localities_path
  end
end
