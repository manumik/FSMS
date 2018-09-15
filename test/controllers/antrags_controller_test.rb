require 'test_helper'

class AntragsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @antrag = antrags(:one)
  end

  test "should get index" do
    get antrags_url
    assert_response :success
  end

  test "should get new" do
    get new_antrag_url
    assert_response :success
  end

  test "should create antrag" do
    assert_difference('Antrag.count') do
      post antrags_url, params: { antrag: { beschreibung: @antrag.beschreibung, kunden: @antrag.kunden, name: @antrag.name, status: @antrag.status, typ: @antrag.typ } }
    end

    assert_redirected_to antrag_url(Antrag.last)
  end

  test "should show antrag" do
    get antrag_url(@antrag)
    assert_response :success
  end

  test "should get edit" do
    get edit_antrag_url(@antrag)
    assert_response :success
  end

  test "should update antrag" do
    patch antrag_url(@antrag), params: { antrag: { beschreibung: @antrag.beschreibung, kunden: @antrag.kunden, name: @antrag.name, status: @antrag.status, typ: @antrag.typ } }
    assert_redirected_to antrag_url(@antrag)
  end

  test "should destroy antrag" do
    assert_difference('Antrag.count', -1) do
      delete antrag_url(@antrag)
    end

    assert_redirected_to antrags_url
  end
end
