json.extract! lager, :id, :name, :beschreibung, :dateiORkunde, :inhalt, :docAnzahl, :created_at, :updated_at
json.url lager_url(lager, format: :json)
