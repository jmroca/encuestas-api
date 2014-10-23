class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.string :descripcion
      t.integer :tipo
      t.integer :prioridad
      t.boolean :obligatoria

      t.timestamps
    end
  end
end
