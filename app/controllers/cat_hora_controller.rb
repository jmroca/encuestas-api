class CatHoraController < ApplicationController
  
  # GET /cat_hora
  # GET /cat_hora.json
  def index
    @horarios = CatHora.all

    
    if @horarios.count > 0
      render json:@horarios, :only =>[:id, :descripcion],status: :ok
    else
      render json:Respuesta.none, status: :no_content
    end
    
  end
  

end
