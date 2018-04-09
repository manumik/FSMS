require 'test_helper'

class DateienKategoriensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dateien_kategorien = dateien_kategoriens(:one)
  end

  test "should get index" do
    get dateien_kategoriens_url
    assert_response :success
  end

  test "should get new" do
    get new_dateien_kategorien_url
    assert_response :success
  end

  test "should create dateien_kategorien" do
    assert_difference('DateienKategorien.count') do
      post dateien_kategoriens_url, params: { dateien_kategorien: { name: @dateien_kategorien.name } }
    end

    assert_redirected_to dateien_kategorien_url(DateienKategorien.last)
  end

  test "should show dateien_kategorien" do
    get dateien_kategorien_url(@dateien_kategorien)
    assert_response :success
  end

  test "should get edit" do
    get edit_dateien_kategorien_url(@dateien_kategorien)
    assert_response :success
  end

  test "should update dateien_kategorien" do
    patch dateien_kategorien_url(@dateien_kategorien), params: { dateien_kategorien: { name: @dateien_kategorien.name } }
    assert_redirected_to dateien_kategorien_url(@dateien_kategorien)
  end

  test "should destroy dateien_kategorien" do
    assert_difference('DateienKategorien.count', -1) do
      delete dateien_kategorien_url(@dateien_kategorien)
    end

    assert_redirected_to dateien_kategoriens_url
  end
end
