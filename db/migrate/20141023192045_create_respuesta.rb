class CreateRespuesta < ActiveRecord::Migration
  def change
    create_table :respuesta do |t|
      t.string :descripcion
      t.string :imagen
      t.integer :valor

      t.timestamps
    end
  end
end
