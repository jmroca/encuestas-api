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

ActiveRecord::Schema.define(version: 20141028005407) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

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

  create_table "usuarios", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
