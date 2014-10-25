class PreguntaController < ApplicationController
  before_action :set_pregunta, only: [:show]

  # GET /pregunta
  # GET /pregunta.json
  def index
    @pregunta = Pregunta.all

    # buscamos parametro de tipo para filtrar la consulta
    if tipo = params[:tipo]
      @pregunta = @pregunta.where(tipo: tipo)
    end

    respond_to do |format|
    if @pregunta.count > 0
      #render json:@pregunta, :only =>[:id, :descripcion, :obligatoria], status: :ok 
      format.json
    else
      format.json { render json:Pregunta.none, status: :no_content }
    end
    end
  end

  # GET /pregunta/1
  # GET /pregunta/1.json
  def show
    render json:@pregunta, :only =>[:id, :descripcion, :obligatoria], status: :ok
  end

=begin
  # GET /pregunta/new
  def new
    @pregunta = Pregunta.new
  end

  # GET /pregunta/1/edit
  def edit
  end


  # POST /pregunta
  # POST /pregunta.json
  def create
    @pregunta = Pregunta.new(pregunta_params)

    respond_to do |format|
      if @pregunta.save
        format.html { redirect_to @pregunta, notice: 'Pregunta was successfully created.' }
        format.json { render :show, status: :created, location: @pregunta }
      else
        format.html { render :new }
        format.json { render json: @pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pregunta/1
  # PATCH/PUT /pregunta/1.json
  def update
    respond_to do |format|
      if @pregunta.update(pregunta_params)
        format.html { redirect_to @pregunta, notice: 'Pregunta was successfully updated.' }
        format.json { render :show, status: :ok, location: @pregunta }
      else
        format.html { render :edit }
        format.json { render json: @pregunta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pregunta/1
  # DELETE /pregunta/1.json
  def destroy
    @pregunta.destroy
    respond_to do |format|
      format.html { redirect_to pregunta_index_url, notice: 'Pregunta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pregunta
      @pregunta = Pregunta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pregunta_params
      params.require(:pregunta).permit(:tipo)
      
    end
end
