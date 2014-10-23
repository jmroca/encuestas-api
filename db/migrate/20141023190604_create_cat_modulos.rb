class CreateCatModulos < ActiveRecord::Migration
  def change
    create_table :cat_modulos do |t|
      t.string :descripcion, limit: 30
      t.boolean :movil
      t.boolean :capitalino
      t.integer :capacidad

      t.timestamps
    end
  end
end
