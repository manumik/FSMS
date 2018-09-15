json.extract! antrag, :id, :name, :typ, :kunden, :status, :beschreibung, :created_at, :updated_at
json.url antrag_url(antrag, format: :json)
