class DetalleEncuestaController < ApplicationController

  # POST /detalle_encuesta
  # POST /detalle_encuesta.json
  def create

  	# validar parametros
  	detalle_encuesta_params

  	# obtener la encuesta y la pregunta
  	@detalle = DetalleEncuesta.where('encuesta_id = ? AND pregunta_id = ?', params[:encuesta_id], params[:pregunta_id])

  	respond_to do |format|

  		# validar que se hayan obtenido datos
  		if @detalle.count > 0
  			
        # asociar la respuesta 
 			  @detalle.first.respuesta = Respuesta.find(params[:respuesta_id])
 	
	      if @detalle.first.save
	        format.json { render json: @detalle.first, status: :ok }
	      else
	        format.json { render json: @detalle.first.errors, status: :unprocessable_entity }
	      end
    	else
    		# reportar error
 			format.json { render json: @detalle, status: :unprocessable_entity }
 		end
    end
  end


	private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_encuesta_params
      params.require(:pregunta_id)
      params.require(:encuesta_id)
      params.permit(:encuesta_id,:pregunta_id,:respuesta_id)
      
    end
end
