# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180910180040) do

  create_table "antrag_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "beschreibung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "antrag_typs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "beschreibung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "antrags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "typ"
    t.integer "kunden"
    t.integer "status"
    t.string "beschreibung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "datei"
    t.integer "bezug"
  end

  create_table "dateien_kategoriens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "datens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "dateipfad"
    t.integer "kategorie"
    t.integer "studiengang"
    t.integer "modul"
    t.string "semester"
    t.integer "professor"
    t.string "autor"
    t.boolean "druckbar"
    t.boolean "sichtbar"
    t.boolean "sendbar"
    t.timestamp "hinzugefuegt"
    t.float "preis", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seiten"
    t.integer "lager"
    t.integer "besitzer"
  end

  create_table "invetar_typs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "name", null: false
    t.string "icon"
  end

  create_table "invetars", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "invetarnummer"
    t.integer "typ"
    t.integer "kunden"
    t.string "beschreibung"
    t.timestamp "backat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ausleihbar"
    t.float "pfand", limit: 24
    t.integer "bezug"
  end

  create_table "lagers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "beschreibung"
    t.boolean "dateiORkunde"
    t.integer "inhalt"
    t.integer "docAnzahl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bib"
    t.string "password_digest"
    t.string "spitzname"
    t.string "name"
    t.string "surename"
    t.string "email"
    t.bigint "tel"
    t.integer "studengang"
    t.integer "softwarerechte"
    t.string "chipid"
    t.integer "getraenke"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moduls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "orderid"
    t.bigint "kunde"
    t.integer "datei"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seiten"
    t.integer "lager"
    t.string "beschreibung"
    t.float "preis", limit: 24
  end

  create_table "professors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "surname"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "value"
    t.string "beschreibung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "softwarerechtes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "beschreibung"
    t.boolean "kasse_neuerKunde"
    t.boolean "kasse_bezahlen"
    t.boolean "kasse_ausgeben"
    t.boolean "dreamspark_aufnehmen"
    t.boolean "dreamspark_editiren"
    t.boolean "drucken"
    t.boolean "ausleihen_algemein"
    t.boolean "ausleihen_laptop"
    t.boolean "antrag_New"
    t.boolean "antrag_Show"
    t.boolean "antrag_delete"
    t.boolean "antrag_edit"
    t.boolean "antragtyp"
    t.boolean "antragStatus"
    t.boolean "datein_New"
    t.boolean "datein_Show"
    t.boolean "datein_delete"
    t.boolean "datein_edit"
    t.string "dateienKatigorie"
    t.boolean "modul"
    t.boolean "professor"
    t.boolean "studiengang"
    t.boolean "invetar_New"
    t.boolean "invetar_Show"
    t.boolean "invetar_delete"
    t.boolean "invetar_edit"
    t.boolean "member_New"
    t.boolean "member_Show"
    t.boolean "member_delete"
    t.boolean "member_edit"
    t.boolean "order_New"
    t.boolean "order_Show"
    t.boolean "order_delete"
    t.boolean "order_edit"
    t.boolean "orderStatus"
    t.boolean "softwarerechte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studenten_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "bibnummer"
    t.string "surname"
    t.string "name"
    t.string "tel"
    t.string "email"
    t.integer "percentage"
    t.integer "studiengang"
    t.integer "kundenstatus"
    t.timestamp "ersteinschreibung"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "studiengangs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "texts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "tag"
    t.string "de"
    t.string "en"
    t.string "fr"
    t.string "sp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "passwort_digest"
    t.integer "bibnummber"
    t.integer "tel"
    t.string "studiengang"
    t.integer "softwarerechte"
    t.integer "chipid"
    t.string "password_digest"
  end

end
