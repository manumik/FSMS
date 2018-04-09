json.extract! student, :id, :bibnummer, :surname, :name, :tel, :email, :percentage, :studiengang, :kundenstatus, :ersteinschreibung, :created_at, :updated_at
json.url student_url(student, format: :json)
