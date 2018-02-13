require 'test_helper'

class EmergencyConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emergency_condition = emergency_conditions(:one)
  end

  test "should get index" do
    get emergency_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_emergency_condition_url
    assert_response :success
  end

  test "should create emergency_condition" do
    assert_difference('EmergencyCondition.count') do
      post emergency_conditions_url, params: { emergency_condition: {  } }
    end

    assert_redirected_to emergency_condition_url(EmergencyCondition.last)
  end

  test "should show emergency_condition" do
    get emergency_condition_url(@emergency_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_emergency_condition_url(@emergency_condition)
    assert_response :success
  end

  test "should update emergency_condition" do
    patch emergency_condition_url(@emergency_condition), params: { emergency_condition: {  } }
    assert_redirected_to emergency_condition_url(@emergency_condition)
  end

  test "should destroy emergency_condition" do
    assert_difference('EmergencyCondition.count', -1) do
      delete emergency_condition_url(@emergency_condition)
    end

    assert_redirected_to emergency_conditions_url
  end
end
