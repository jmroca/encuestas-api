class EncuestasController < ApplicationController
  before_action :set_encuesta, only: [:show, :edit, :update, :destroy]

  # GET /encuestas
  # GET /encuestas.json
  def index
    @encuestas = Encuesta.all
  end

  # GET /encuestas/1
  # GET /encuestas/1.json
  def show
  end

  
  # GET /encuestas/1/edit
  def edit
  end

  # POST /encuestas
  # POST /encuestas.json
  def create

    puts params[:fechaTramite]

    # crear encuesta en base a parametros validados
    @encuesta = Encuesta.new(encuesta_params)

    puts @encuesta.fechaTramite

    # asociar las preguntas a la encuesta creada
    @encuesta.pregunta << Pregunta.all

    respond_to do |format|
      if @encuesta.save
        
        format.html { redirect_to @encuesta, notice: 'Encuesta was successfully created.' }
        format.json { render :show, status: :created, location: @encuesta }
      
      else
      
        format.html { render :new }
        format.json { render json: @encuesta.errors, status: :unprocessable_entity }
      
      end
    end
  
  end

  # PATCH/PUT /encuestas/1
  # PATCH/PUT /encuestas/1.json
  def update
    respond_to do |format|
      if @encuesta.update(update_encuesta_params)
        format.html { redirect_to @encuesta, notice: 'Encuesta was successfully updated.' }
        format.json { render :show, status: :ok, location: @encuesta }
      else
        format.html { render :edit }
        format.json { render json: @encuesta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encuestas/1
  # DELETE /encuestas/1.json
  def destroy
    @encuesta.destroy
    respond_to do |format|
      format.html { redirect_to encuestas_url, notice: 'Encuesta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encuesta
      @encuesta = Encuesta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encuesta_params
      params.require(:fechaTramite)
      params.require(:cat_hora_id)
      params.require(:cat_modulo_id)
      params.permit(:cat_modulo_id, :cat_hora_id, :fechaTramite, :nombre, :edad, :telefono,:observaciones)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def update_encuesta_params
      params.permit(:cat_modulo_id, :cat_hora_id, :fechaTramite, :nombre, :edad, :telefono,:observaciones)
    end

end
