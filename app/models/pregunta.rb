class Pregunta < ActiveRecord::Base
	has_many :detalle_encuestas

	validates :descripcion,presence: :true
	
end
