json.array!(@encuestas) do |encuesta|
  json.extract! encuesta, :id, :cat_modulo_id, :cat_hora_id, :fechaTramite, :nombre, :edad, :telefono, :procesada, :observaciones
  json.url encuesta_url(encuesta, format: :json)
end
