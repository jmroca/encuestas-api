class DetalleEncuesta < ActiveRecord::Base
  belongs_to :encuesta
  belongs_to :pregunta
  belongs_to :respuesta

  validates :encuesta, :presence => true
  validates :pregunta, :presence => true
  validates_associated :encuesta
  validates_associated :pregunta
	
end
