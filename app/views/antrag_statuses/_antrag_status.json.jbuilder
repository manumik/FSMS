json.extract! antrag_status, :id, :name, :beschreibung, :created_at, :updated_at
json.url antrag_status_url(antrag_status, format: :json)
