class RespuestaController < ApplicationController
  before_action :set_respuesta, only: [:show]

  # GET /respuesta
  # GET /respuesta.json
  def index
    @respuesta = Respuesta.all

    
    if @respuesta.count > 0
      render json:@respuesta, :only =>[:id, :descripcion, :imagen],status: :ok
    else
      render json:Respuesta.none, status: :no_content
    end
    
  end

  # GET /respuesta/1
  # GET /respuesta/1.json
  def show
    render json:@respuesta, :only =>[:id, :descripcion, :imagen],status: :ok
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respuesta
      @respuesta = Respuesta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respuesta_params
      params.require(:respuesta).permit(:tipo)
      
    end
end
