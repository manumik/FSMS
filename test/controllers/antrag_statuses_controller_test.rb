require 'test_helper'

class AntragStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @antrag_status = antrag_statuses(:one)
  end

  test "should get index" do
    get antrag_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_antrag_status_url
    assert_response :success
  end

  test "should create antrag_status" do
    assert_difference('AntragStatus.count') do
      post antrag_statuses_url, params: { antrag_status: { beschreibung: @antrag_status.beschreibung, name: @antrag_status.name } }
    end

    assert_redirected_to antrag_status_url(AntragStatus.last)
  end

  test "should show antrag_status" do
    get antrag_status_url(@antrag_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_antrag_status_url(@antrag_status)
    assert_response :success
  end

  test "should update antrag_status" do
    patch antrag_status_url(@antrag_status), params: { antrag_status: { beschreibung: @antrag_status.beschreibung, name: @antrag_status.name } }
    assert_redirected_to antrag_status_url(@antrag_status)
  end

  test "should destroy antrag_status" do
    assert_difference('AntragStatus.count', -1) do
      delete antrag_status_url(@antrag_status)
    end

    assert_redirected_to antrag_statuses_url
  end
end
