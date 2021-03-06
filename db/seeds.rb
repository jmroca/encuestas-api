CatHora.create!([
  {descripcion: "8:00 a 9:00", matutino: true},
  {descripcion: "9:00 a 12:00", matutino: true},
  {descripcion: "12:00 a 14:00", matutino: false},
  {descripcion: "14:00 a 18:00", matutino: false}
])
CatModulo.create!([
  {descripcion: "Modulo Central Zona 9", movil: false, capitalino: true, capacidad: 2000},
  {descripcion: "Modulo San Rafael z. 18", movil: false, capitalino: true, capacidad: 1000},
  {descripcion: "Modulo Roosevelt ", movil: false, capitalino: true, capacidad: 2000},
  {descripcion: "Modulo Zacapa", movil: false, capitalino: false, capacidad: 500}
])
Pregunta.create!([
  {descripcion: "La atencion del personal de Transito fue:", tipo: 2, prioridad: 1, obligatoria: true},
  {descripcion: "La atención del personal del Banco fue:", tipo: 2, prioridad: 1, obligatoria: true},
  {descripcion: "La atención del personal de la Optica fue:", tipo: 2, prioridad: 1, obligatoria: true},
  {descripcion: "La atención del personal de la Escuela de Manejo fue:", tipo: 2, prioridad: 1, obligatoria: true},
  {descripcion: "El trato de las personas que le atendieron fue:", tipo: 1, prioridad: 1, obligatoria: true},
  {descripcion: "La presentación de las personas que le atendieron fue:", tipo: 1, prioridad: 1, obligatoria: true},
  {descripcion: "El orden del tramite fue:", tipo: 1, prioridad: 1, obligatoria: true},
  {descripcion: "La limpieza y las instalaciones en general son:", tipo: 1, prioridad: 2, obligatoria: true},
  {descripcion: "El tiempo del tramite después de su pago en el Banco fue:", tipo: 1, prioridad: 1, obligatoria: true},
  {descripcion: "El servicio prestado en general fue:", tipo: 1, prioridad: 1, obligatoria: true},
  {descripcion: "La calidad del documento proporcionado es:", tipo: 1, prioridad: 1, obligatoria: true}
])
Respuesta.create!([
  {descripcion: "Muy Bueno", imagen: "assets/respuesta1.png", valor: 10},
  {descripcion: "Bueno", imagen: "assets/respuesta2.png", valor: 8},
  {descripcion: "Necesita Mejorar", imagen: "assets/respuesta3.png", valor: 6},
  {descripcion: "Malo", imagen: "assets/respuesta4.png", valor: 3}
])
Usuario.create!([
  {email: "jmdelaroca@maycom.com.gt", password: "password", password_confirmation: "password" }
])
AdminUser.create!([
  {email: "admin@example.com", password: "password", password_confirmation: "password"}
])
