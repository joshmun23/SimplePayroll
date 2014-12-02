require 'test_helper'

class SelectEmployeesControllerTest < ActionController::TestCase
  setup do
    @select_employee = select_employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:select_employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create select_employee" do
    assert_difference('SelectEmployee.count') do
      post :create, select_employee: {  }
    end

    assert_redirected_to select_employee_path(assigns(:select_employee))
  end

  test "should show select_employee" do
    get :show, id: @select_employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @select_employee
    assert_response :success
  end

  test "should update select_employee" do
    patch :update, id: @select_employee, select_employee: {  }
    assert_redirected_to select_employee_path(assigns(:select_employee))
  end

  test "should destroy select_employee" do
    assert_difference('SelectEmployee.count', -1) do
      delete :destroy, id: @select_employee
    end

    assert_redirected_to select_employees_path
  end
end
