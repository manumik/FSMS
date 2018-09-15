json.extract! antrag_typ, :id, :name, :beschreibung, :created_at, :updated_at
json.url antrag_typ_url(antrag_typ, format: :json)
