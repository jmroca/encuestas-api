class Respuesta < ActiveRecord::Base
	has_many :detalle_encuestas

	validates :descripcion,presence: :true, uniqueness: :true
	
end
