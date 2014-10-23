class CreateDetalleEncuestas < ActiveRecord::Migration
  def change
    create_table :detalle_encuestas do |t|
      t.references :encuesta, index: true
      t.references :pregunta, index: true
      t.references :respuesta, index: true

      t.timestamps
    end
  end
end
