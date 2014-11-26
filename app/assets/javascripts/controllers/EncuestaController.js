(function () {
	
	'use strict';

	var	app = angular.module('EncuestasApp.controllers', []);
	

	app.controller('EncuestaController', [ 'dataService', '$log', '$rootScope',
	 	function(dataService, $log, $rootScope) {

		// evitar uso de this fuera de contexto, usar variable vm que significa 'viewmodel'
		var vm = this;

		$log.log('EncuestaController loaded!');

		vm.title = 'Encuesta Satisfaccion';
		
		dataService.getCatalogo('preguntas')
			.then(
	           function(data) {
	           vm.dataPreguntas = data;
	           $log.log(data.length);
	          },
	          function(error) {
	           $log.log(Date.now() + ' - ERROR - calls failed, error is\n\n' + JSON.stringify(error));
	          });

		dataService.getCatalogo('respuestas')
			.then(
	           function(data) {
	           vm.dataRespuestas = data;
	           $log.log(data.length);
	          },
	          function(error) {
	           $log.log(Date.now() + ' - ERROR - calls failed, error is\n\n' + JSON.stringify(error));
	          });


		vm.respuestasMarcadas = [
			{resp : '0'},
			{resp : '0'},
			{resp : '0'},
			{resp : '0'},
			{resp : '0'},
			{resp : '0'},
			{resp : '0'},
			{resp : '0'},
			{resp : '0'},
			{resp : '0'},
			{resp : '0'}
		];

		// escuchando el evento que indica la necesidad de resetear la data de la encuesta activa.
		$rootScope.$on('RESET_DATA', function() {

			var i;

			$log.log('Reset Data Encuesta!');

			for(i=0; i< vm.respuestasMarcadas.length; i++)
				vm.respuestasMarcadas[i].resp = '0';

			// limpiar objeto que almacena la encuestra creada
			var activa = dataService.getEncuestaActiva();

			activa = {
						id: 0,
						cat_modulo_id: 1,
						cat_hora_id: 1,
						fechaTramite: new Date(),
						nombre: "",
						edad: null,
						telefono: "",
						observaciones: ""
					};

		});

		vm.marcarRespuestaPregunta = function(pregunta){

  			$log.log(dataService.getEncuestaActiva().observaciones);
  			$log.log('EncuestaId: ' + dataService.getEncuestaActiva().id +  ' -> Pregunta# ' + pregunta.id + ' Resp:' + vm.respuestasMarcadas[pregunta.id].resp);
  			dataService.postRespuestaMarcada(dataService.getEncuestaActiva().id,pregunta.id, vm.respuestasMarcadas[pregunta.id].resp);
  			
  		};
  		
  		
  		
	}]);

	
})();