class CreateEncuestas < ActiveRecord::Migration
  def change
    create_table :encuestas do |t|
      t.references :cat_modulo, index: true
      t.references :cat_hora, index: true
      t.date :fechaTramite
      t.string :nombre
      t.integer :edad
      t.string :telefono, limit: 10
      t.boolean :procesada
      t.text :observaciones

      t.timestamps
    end
  end
end
