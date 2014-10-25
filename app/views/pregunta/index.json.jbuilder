json.array!(@pregunta) do |pregunta|
  json.extract! pregunta, :id, :descripcion
  json.url pregunta_url(pregunta, format: :json)
end
