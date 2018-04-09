json.extract! daten, :id, :name, :dateipfad, :kategorie, :studiengang, :modul, :semester, :professor, :autor, :druckbar, :sichtbar, :sendbar, :hinzugefuegt, :preis, :created_at, :updated_at
json.url daten_url(daten, format: :json)
