class AddIndexToDetalleEncuesta < ActiveRecord::Migration
  def change
  	add_index :detalle_encuestas, [:encuesta_id, :pregunta_id], :unique => true
  end
end
