require File.dirname(__FILE__) + '/../../test_helper'

class Admin::VaccinesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_vaccines)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_vaccine
    assert_difference('Admin::Vaccine.count') do
      post :create, :vaccine => { }
    end

    assert_redirected_to vaccine_path(assigns(:vaccine))
  end

  def test_should_show_vaccine
    get :show, :id => admin_vaccines(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => admin_vaccines(:one).id
    assert_response :success
  end

  def test_should_update_vaccine
    put :update, :id => admin_vaccines(:one).id, :vaccine => { }
    assert_redirected_to vaccine_path(assigns(:vaccine))
  end

  def test_should_destroy_vaccine
    assert_difference('Admin::Vaccine.count', -1) do
      delete :destroy, :id => admin_vaccines(:one).id
    end

    assert_redirected_to admin_vaccines_path
  end
end
