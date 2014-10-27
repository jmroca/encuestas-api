class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  respond_to :json

  rescue_from(ActiveRecord::RecordInvalid) do |invalid|
  	response = {status: 'error',fields:invalid.record.errors}
  	render json:response, status: :unprocessable_entity
  end

	rescue_from(ActiveRecord::RecordNotFound) do |invalid|
  	response = {status: 'error',fields:'Registro Inexistente'}
  	render json:response, status: :unprocessable_entity
  end

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
  	faltante = "Parametro Faltante: #{parameter_missing_exception.param}"
  	response = {status: 'error',fields:faltante}
  	render json:response, status: :unprocessable_entity
  end


end
