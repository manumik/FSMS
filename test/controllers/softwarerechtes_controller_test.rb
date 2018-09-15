require 'test_helper'

class SoftwarerechtesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @softwarerechte = softwarerechtes(:one)
  end

  test "should get index" do
    get softwarerechtes_url
    assert_response :success
  end

  test "should get new" do
    get new_softwarerechte_url
    assert_response :success
  end

  test "should create softwarerechte" do
    assert_difference('Softwarerechte.count') do
      post softwarerechtes_url, params: { softwarerechte: { antragStatus: @softwarerechte.antragStatus, antrag_New: @softwarerechte.antrag_New, antrag_Show: @softwarerechte.antrag_Show, antrag_delete: @softwarerechte.antrag_delete, antrag_edit: @softwarerechte.antrag_edit, antragtyp: @softwarerechte.antragtyp, ausleihen_algemein: @softwarerechte.ausleihen_algemein, ausleihen_laptop: @softwarerechte.ausleihen_laptop, beschreibung: @softwarerechte.beschreibung, dateienKatigorie: @softwarerechte.dateienKatigorie, datein_New: @softwarerechte.datein_New, datein_Show: @softwarerechte.datein_Show, datein_delete: @softwarerechte.datein_delete, datein_edit: @softwarerechte.datein_edit, dreamspark_aufnehmen: @softwarerechte.dreamspark_aufnehmen, dreamspark_editiren: @softwarerechte.dreamspark_editiren, drucken: @softwarerechte.drucken, invetar_New: @softwarerechte.invetar_New, invetar_Show: @softwarerechte.invetar_Show, invetar_delete: @softwarerechte.invetar_delete, invetar_edit: @softwarerechte.invetar_edit, kasse_ausgeben: @softwarerechte.kasse_ausgeben, kasse_bezahlen: @softwarerechte.kasse_bezahlen, kasse_neuerKunde: @softwarerechte.kasse_neuerKunde, member_New: @softwarerechte.member_New, member_Show: @softwarerechte.member_Show, member_delete: @softwarerechte.member_delete, member_edit: @softwarerechte.member_edit, modul: @softwarerechte.modul, name: @softwarerechte.name, orderStatus: @softwarerechte.orderStatus, order_New: @softwarerechte.order_New, order_Show: @softwarerechte.order_Show, order_delete: @softwarerechte.order_delete, order_edit: @softwarerechte.order_edit, professor: @softwarerechte.professor, softwarerechte: @softwarerechte.softwarerechte, studiengang: @softwarerechte.studiengang } }
    end

    assert_redirected_to softwarerechte_url(Softwarerechte.last)
  end

  test "should show softwarerechte" do
    get softwarerechte_url(@softwarerechte)
    assert_response :success
  end

  test "should get edit" do
    get edit_softwarerechte_url(@softwarerechte)
    assert_response :success
  end

  test "should update softwarerechte" do
    patch softwarerechte_url(@softwarerechte), params: { softwarerechte: { antragStatus: @softwarerechte.antragStatus, antrag_New: @softwarerechte.antrag_New, antrag_Show: @softwarerechte.antrag_Show, antrag_delete: @softwarerechte.antrag_delete, antrag_edit: @softwarerechte.antrag_edit, antragtyp: @softwarerechte.antragtyp, ausleihen_algemein: @softwarerechte.ausleihen_algemein, ausleihen_laptop: @softwarerechte.ausleihen_laptop, beschreibung: @softwarerechte.beschreibung, dateienKatigorie: @softwarerechte.dateienKatigorie, datein_New: @softwarerechte.datein_New, datein_Show: @softwarerechte.datein_Show, datein_delete: @softwarerechte.datein_delete, datein_edit: @softwarerechte.datein_edit, dreamspark_aufnehmen: @softwarerechte.dreamspark_aufnehmen, dreamspark_editiren: @softwarerechte.dreamspark_editiren, drucken: @softwarerechte.drucken, invetar_New: @softwarerechte.invetar_New, invetar_Show: @softwarerechte.invetar_Show, invetar_delete: @softwarerechte.invetar_delete, invetar_edit: @softwarerechte.invetar_edit, kasse_ausgeben: @softwarerechte.kasse_ausgeben, kasse_bezahlen: @softwarerechte.kasse_bezahlen, kasse_neuerKunde: @softwarerechte.kasse_neuerKunde, member_New: @softwarerechte.member_New, member_Show: @softwarerechte.member_Show, member_delete: @softwarerechte.member_delete, member_edit: @softwarerechte.member_edit, modul: @softwarerechte.modul, name: @softwarerechte.name, orderStatus: @softwarerechte.orderStatus, order_New: @softwarerechte.order_New, order_Show: @softwarerechte.order_Show, order_delete: @softwarerechte.order_delete, order_edit: @softwarerechte.order_edit, professor: @softwarerechte.professor, softwarerechte: @softwarerechte.softwarerechte, studiengang: @softwarerechte.studiengang } }
    assert_redirected_to softwarerechte_url(@softwarerechte)
  end

  test "should destroy softwarerechte" do
    assert_difference('Softwarerechte.count', -1) do
      delete softwarerechte_url(@softwarerechte)
    end

    assert_redirected_to softwarerechtes_url
  end
end
