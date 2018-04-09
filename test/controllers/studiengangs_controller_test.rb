require 'test_helper'

class StudiengangsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @studiengang = studiengangs(:one)
  end

  test "should get index" do
    get studiengangs_url
    assert_response :success
  end

  test "should get new" do
    get new_studiengang_url
    assert_response :success
  end

  test "should create studiengang" do
    assert_difference('Studiengang.count') do
      post studiengangs_url, params: { studiengang: { name: @studiengang.name } }
    end

    assert_redirected_to studiengang_url(Studiengang.last)
  end

  test "should show studiengang" do
    get studiengang_url(@studiengang)
    assert_response :success
  end

  test "should get edit" do
    get edit_studiengang_url(@studiengang)
    assert_response :success
  end

  test "should update studiengang" do
    patch studiengang_url(@studiengang), params: { studiengang: { name: @studiengang.name } }
    assert_redirected_to studiengang_url(@studiengang)
  end

  test "should destroy studiengang" do
    assert_difference('Studiengang.count', -1) do
      delete studiengang_url(@studiengang)
    end

    assert_redirected_to studiengangs_url
  end
end
