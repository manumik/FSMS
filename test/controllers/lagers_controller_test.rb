require 'test_helper'

class LagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lager = lagers(:one)
  end

  test "should get index" do
    get lagers_url
    assert_response :success
  end

  test "should get new" do
    get new_lager_url
    assert_response :success
  end

  test "should create lager" do
    assert_difference('Lager.count') do
      post lagers_url, params: { lager: { beschreibung: @lager.beschreibung, dateiORkunde: @lager.dateiORkunde, docAnzahl: @lager.docAnzahl, inhalt: @lager.inhalt, name: @lager.name } }
    end

    assert_redirected_to lager_url(Lager.last)
  end

  test "should show lager" do
    get lager_url(@lager)
    assert_response :success
  end

  test "should get edit" do
    get edit_lager_url(@lager)
    assert_response :success
  end

  test "should update lager" do
    patch lager_url(@lager), params: { lager: { beschreibung: @lager.beschreibung, dateiORkunde: @lager.dateiORkunde, docAnzahl: @lager.docAnzahl, inhalt: @lager.inhalt, name: @lager.name } }
    assert_redirected_to lager_url(@lager)
  end

  test "should destroy lager" do
    assert_difference('Lager.count', -1) do
      delete lager_url(@lager)
    end

    assert_redirected_to lagers_url
  end
end
