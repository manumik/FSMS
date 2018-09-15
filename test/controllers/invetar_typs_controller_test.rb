require 'test_helper'

class InvetarTypsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invetar_typ = invetar_typs(:one)
  end

  test "should get index" do
    get invetar_typs_url
    assert_response :success
  end

  test "should get new" do
    get new_invetar_typ_url
    assert_response :success
  end

  test "should create invetar_typ" do
    assert_difference('InvetarTyp.count') do
      post invetar_typs_url, params: { invetar_typ: { name: @invetar_typ.name } }
    end

    assert_redirected_to invetar_typ_url(InvetarTyp.last)
  end

  test "should show invetar_typ" do
    get invetar_typ_url(@invetar_typ)
    assert_response :success
  end

  test "should get edit" do
    get edit_invetar_typ_url(@invetar_typ)
    assert_response :success
  end

  test "should update invetar_typ" do
    patch invetar_typ_url(@invetar_typ), params: { invetar_typ: { name: @invetar_typ.name } }
    assert_redirected_to invetar_typ_url(@invetar_typ)
  end

  test "should destroy invetar_typ" do
    assert_difference('InvetarTyp.count', -1) do
      delete invetar_typ_url(@invetar_typ)
    end

    assert_redirected_to invetar_typs_url
  end
end
