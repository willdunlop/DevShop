require 'test_helper'

class DevCornersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dev_corner = dev_corners(:one)
  end

  test "should get index" do
    get dev_corners_url
    assert_response :success
  end

  test "should get new" do
    get new_dev_corner_url
    assert_response :success
  end

  test "should create dev_corner" do
    assert_difference('DevCorner.count') do
      post dev_corners_url, params: { dev_corner: { experience: @dev_corner.experience, profile_id: @dev_corner.profile_id, skills: @dev_corner.skills, strengths: @dev_corner.strengths } }
    end

    assert_redirected_to dev_corner_url(DevCorner.last)
  end

  test "should show dev_corner" do
    get dev_corner_url(@dev_corner)
    assert_response :success
  end

  test "should get edit" do
    get edit_dev_corner_url(@dev_corner)
    assert_response :success
  end

  test "should update dev_corner" do
    patch dev_corner_url(@dev_corner), params: { dev_corner: { experience: @dev_corner.experience, profile_id: @dev_corner.profile_id, skills: @dev_corner.skills, strengths: @dev_corner.strengths } }
    assert_redirected_to dev_corner_url(@dev_corner)
  end

  test "should destroy dev_corner" do
    assert_difference('DevCorner.count', -1) do
      delete dev_corner_url(@dev_corner)
    end

    assert_redirected_to dev_corners_url
  end
end
