require 'test_helper'

class InvetarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invetar = invetars(:one)
  end

  test "should get index" do
    get invetars_url
    assert_response :success
  end

  test "should get new" do
    get new_invetar_url
    assert_response :success
  end

  test "should create invetar" do
    assert_difference('Invetar.count') do
      post invetars_url, params: { invetar: { backat: @invetar.backat, beschreibung: @invetar.beschreibung, invetarnummer: @invetar.invetarnummer, kunden: @invetar.kunden, typ: @invetar.typ } }
    end

    assert_redirected_to invetar_url(Invetar.last)
  end

  test "should show invetar" do
    get invetar_url(@invetar)
    assert_response :success
  end

  test "should get edit" do
    get edit_invetar_url(@invetar)
    assert_response :success
  end

  test "should update invetar" do
    patch invetar_url(@invetar), params: { invetar: { backat: @invetar.backat, beschreibung: @invetar.beschreibung, invetarnummer: @invetar.invetarnummer, kunden: @invetar.kunden, typ: @invetar.typ } }
    assert_redirected_to invetar_url(@invetar)
  end

  test "should destroy invetar" do
    assert_difference('Invetar.count', -1) do
      delete invetar_url(@invetar)
    end

    assert_redirected_to invetars_url
  end
end
