class CatModulo < ActiveRecord::Base
	has_many :encuestas

	validates :descripcion,presence: :true, uniqueness: :true
	
end
