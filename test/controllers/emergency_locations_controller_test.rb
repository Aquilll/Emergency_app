require 'test_helper'

class EmergencyLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emergency_location = emergency_locations(:one)
  end

  test "should get index" do
    get emergency_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_emergency_location_url
    assert_response :success
  end

  test "should create emergency_location" do
    assert_difference('EmergencyLocation.count') do
      post emergency_locations_url, params: { emergency_location: {  } }
    end

    assert_redirected_to emergency_location_url(EmergencyLocation.last)
  end

  test "should show emergency_location" do
    get emergency_location_url(@emergency_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_emergency_location_url(@emergency_location)
    assert_response :success
  end

  test "should update emergency_location" do
    patch emergency_location_url(@emergency_location), params: { emergency_location: {  } }
    assert_redirected_to emergency_location_url(@emergency_location)
  end

  test "should destroy emergency_location" do
    assert_difference('EmergencyLocation.count', -1) do
      delete emergency_location_url(@emergency_location)
    end

    assert_redirected_to emergency_locations_url
  end
end
