class CreateCatHoras < ActiveRecord::Migration
  def change
    create_table :cat_horas do |t|
      t.string :descripcion, limit: 30
      t.boolean :matutino

      t.timestamps
    end
  end
end
