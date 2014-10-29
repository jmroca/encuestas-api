class DetalleEncuestaController < ApplicationController

  # POST /detalle_encuesta
  # POST /detalle_encuesta.json
  def create

  	# obtener la encuesta y la pregunta
  	@detalle = DetalleEncuesta.where('encuesta_id = ? AND pregunta_id = ?', params[:encuesta_id], params[:pregunta_id])

  	if @detalle
 		@detalle.first.respuesta = Respuesta.find(params[:respuesta_id])
 	end

  	respond_to do |format|
      if @detalle.first.save
        format.html { redirect_to @detalle.first, notice: 'Encuesta was successfully updated.' }
        format.json { render json: @detalle.first, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @detalle.first.errors, status: :unprocessable_entity }
      end
    end
  end


	private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_encuesta_params
      params.require(:pregunta_id)
      params.require(:encuesta_id).permit(:encuesta_id,:pregunta_id,:respuesta_id)
      
    end
end
