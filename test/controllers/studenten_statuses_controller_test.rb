require 'test_helper'

class StudentenStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @studenten_status = studenten_statuses(:one)
  end

  test "should get index" do
    get studenten_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_studenten_status_url
    assert_response :success
  end

  test "should create studenten_status" do
    assert_difference('StudentenStatus.count') do
      post studenten_statuses_url, params: { studenten_status: { status: @studenten_status.status } }
    end

    assert_redirected_to studenten_status_url(StudentenStatus.last)
  end

  test "should show studenten_status" do
    get studenten_status_url(@studenten_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_studenten_status_url(@studenten_status)
    assert_response :success
  end

  test "should update studenten_status" do
    patch studenten_status_url(@studenten_status), params: { studenten_status: { status: @studenten_status.status } }
    assert_redirected_to studenten_status_url(@studenten_status)
  end

  test "should destroy studenten_status" do
    assert_difference('StudentenStatus.count', -1) do
      delete studenten_status_url(@studenten_status)
    end

    assert_redirected_to studenten_statuses_url
  end
end
