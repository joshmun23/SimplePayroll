require 'test_helper'

class PaychecksControllerTest < ActionController::TestCase
  setup do
    @paycheck = paychecks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paychecks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paycheck" do
    assert_difference('Paycheck.count') do
      post :create, paycheck: { employee_id: @paycheck.employee_id, end_date: @paycheck.end_date, gross_wages: @paycheck.gross_wages, name: @paycheck.name, net_wages: @paycheck.net_wages, start_date: @paycheck.start_date, total_deductions: @paycheck.total_deductions, total_hours_worked: @paycheck.total_hours_worked }
    end

    assert_redirected_to paycheck_path(assigns(:paycheck))
  end

  test "should show paycheck" do
    get :show, id: @paycheck
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paycheck
    assert_response :success
  end

  test "should update paycheck" do
    patch :update, id: @paycheck, paycheck: { employee_id: @paycheck.employee_id, end_date: @paycheck.end_date, gross_wages: @paycheck.gross_wages, name: @paycheck.name, net_wages: @paycheck.net_wages, start_date: @paycheck.start_date, total_deductions: @paycheck.total_deductions, total_hours_worked: @paycheck.total_hours_worked }
    assert_redirected_to paycheck_path(assigns(:paycheck))
  end

  test "should destroy paycheck" do
    assert_difference('Paycheck.count', -1) do
      delete :destroy, id: @paycheck
    end

    assert_redirected_to paychecks_path
  end
end
