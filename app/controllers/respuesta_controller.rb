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
  
=begin
  begin
  # GET /respuesta/new
  def new
    @respuesta = Respuesta.new
  end

  # GET /respuesta/1/edit
  def edit
  end


  # POST /respuesta
  # POST /respuesta.json
  def create
    @respuesta = Respuesta.new(respuesta_params)

    respond_to do |format|
      if @respuesta.save
        format.html { redirect_to @respuesta, notice: 'Respuesta was successfully created.' }
        format.json { render :show, status: :created, location: @respuesta }
      else
        format.html { render :new }
        format.json { render json: @respuesta.errors, status: :unprocessable_entity }
      end
    end
  end
=end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respuesta
      @respuesta = Respuesta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respuesta_params
      params.require(:descripcion).permit(:imagen, :valor)
      
    end
end
