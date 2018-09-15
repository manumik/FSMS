require 'test_helper'

class AntragTypsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @antrag_typ = antrag_typs(:one)
  end

  test "should get index" do
    get antrag_typs_url
    assert_response :success
  end

  test "should get new" do
    get new_antrag_typ_url
    assert_response :success
  end

  test "should create antrag_typ" do
    assert_difference('AntragTyp.count') do
      post antrag_typs_url, params: { antrag_typ: { beschreibung: @antrag_typ.beschreibung, name: @antrag_typ.name } }
    end

    assert_redirected_to antrag_typ_url(AntragTyp.last)
  end

  test "should show antrag_typ" do
    get antrag_typ_url(@antrag_typ)
    assert_response :success
  end

  test "should get edit" do
    get edit_antrag_typ_url(@antrag_typ)
    assert_response :success
  end

  test "should update antrag_typ" do
    patch antrag_typ_url(@antrag_typ), params: { antrag_typ: { beschreibung: @antrag_typ.beschreibung, name: @antrag_typ.name } }
    assert_redirected_to antrag_typ_url(@antrag_typ)
  end

  test "should destroy antrag_typ" do
    assert_difference('AntragTyp.count', -1) do
      delete antrag_typ_url(@antrag_typ)
    end

    assert_redirected_to antrag_typs_url
  end
end
