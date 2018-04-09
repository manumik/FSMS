require 'test_helper'

class DatensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daten = datens(:one)
  end

  test "should get index" do
    get datens_url
    assert_response :success
  end

  test "should get new" do
    get new_daten_url
    assert_response :success
  end

  test "should create daten" do
    assert_difference('Daten.count') do
      post datens_url, params: { daten: { autor: @daten.autor, dateipfad: @daten.dateipfad, druckbar: @daten.druckbar, hinzugefuegt: @daten.hinzugefuegt, kategorie: @daten.kategorie, modul: @daten.modul, name: @daten.name, preis: @daten.preis, professor: @daten.professor, semester: @daten.semester, sendbar: @daten.sendbar, sichtbar: @daten.sichtbar, studiengang: @daten.studiengang } }
    end

    assert_redirected_to daten_url(Daten.last)
  end

  test "should show daten" do
    get daten_url(@daten)
    assert_response :success
  end

  test "should get edit" do
    get edit_daten_url(@daten)
    assert_response :success
  end

  test "should update daten" do
    patch daten_url(@daten), params: { daten: { autor: @daten.autor, dateipfad: @daten.dateipfad, druckbar: @daten.druckbar, hinzugefuegt: @daten.hinzugefuegt, kategorie: @daten.kategorie, modul: @daten.modul, name: @daten.name, preis: @daten.preis, professor: @daten.professor, semester: @daten.semester, sendbar: @daten.sendbar, sichtbar: @daten.sichtbar, studiengang: @daten.studiengang } }
    assert_redirected_to daten_url(@daten)
  end

  test "should destroy daten" do
    assert_difference('Daten.count', -1) do
      delete daten_url(@daten)
    end

    assert_redirected_to datens_url
  end
end
