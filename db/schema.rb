# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141023225849) do

  create_table "cat_horas", force: true do |t|
    t.string   "descripcion", limit: 30
    t.boolean  "matutino"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cat_modulos", force: true do |t|
    t.string   "descripcion", limit: 30
    t.boolean  "movil"
    t.boolean  "capitalino"
    t.integer  "capacidad"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detalle_encuestas", force: true do |t|
    t.integer  "encuesta_id"
    t.integer  "pregunta_id"
    t.integer  "respuesta_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detalle_encuestas", ["encuesta_id", "pregunta_id"], name: "index_detalle_encuestas_on_encuesta_id_and_pregunta_id", unique: true, using: :btree
  add_index "detalle_encuestas", ["encuesta_id"], name: "index_detalle_encuestas_on_encuesta_id", using: :btree
  add_index "detalle_encuestas", ["pregunta_id"], name: "index_detalle_encuestas_on_pregunta_id", using: :btree
  add_index "detalle_encuestas", ["respuesta_id"], name: "index_detalle_encuestas_on_respuesta_id", using: :btree

  create_table "encuestas", force: true do |t|
    t.integer  "cat_modulo_id"
    t.integer  "cat_hora_id"
    t.date     "fechaTramite"
    t.string   "nombre"
    t.integer  "edad"
    t.string   "telefono",      limit: 10
    t.boolean  "procesada"
    t.text     "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "encuestas", ["cat_hora_id"], name: "index_encuestas_on_cat_hora_id", using: :btree
  add_index "encuestas", ["cat_modulo_id"], name: "index_encuestas_on_cat_modulo_id", using: :btree

  create_table "pregunta", force: true do |t|
    t.string   "descripcion"
    t.integer  "tipo"
    t.integer  "prioridad"
    t.boolean  "obligatoria"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "respuesta", force: true do |t|
    t.string   "descripcion"
    t.string   "imagen"
    t.integer  "valor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
