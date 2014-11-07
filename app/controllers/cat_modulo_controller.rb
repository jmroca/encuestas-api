class CatModuloController < ApplicationController
  
  # GET /cat_hora
  # GET /cat_hora.json
  def index
    @modulos = CatModulo.all

    
    if @modulos.count > 0
      render json:@modulos, :only =>[:id, :descripcion],status: :ok
    else
      render json:Respuesta.none, status: :no_content
    end
    
  end
  

end