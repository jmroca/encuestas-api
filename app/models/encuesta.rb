class Encuesta < ActiveRecord::Base
  belongs_to :cat_modulo
  belongs_to :cat_hora

  has_many :detalle_encuestas
  has_many :pregunta, through: :detalle_encuestas
  has_many :respuesta, through: :detalle_encuestas

  validates :fechaTramite,presence: :true
  validates :cat_hora, :presence => true
  validates :cat_modulo, :presence => true
  
  validates_associated :cat_modulo
  validates_associated :cat_hora
  
end
