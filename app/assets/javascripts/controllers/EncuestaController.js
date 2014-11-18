(function () {
	
	'use strict';

	var	app = angular.module('EncuestasApp.controllers', []);
	

	app.controller('EncuestaController', [ 'dataService', '$log', '$routeParams', '$location',
	 	function(dataService, $log, $routeParams, $location) {

		// evitar uso de this fuera de contexto, usar variable vm que significa 'viewmodel'
		var vm = this;

		vm.$location = $location;
     	vm.$routeParams = $routeParams;
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

		vm.marcarRespuestaPregunta = function(pregunta){

  			$log.log(dataService.getEncuestaActiva().observaciones);
  			$log.log('EncuestaId: ' + dataService.getEncuestaActiva().id +  ' -> Pregunta# ' + pregunta.id + ' Resp:' + vm.respuestasMarcadas[pregunta.id].resp);
  			dataService.postRespuestaMarcada(dataService.getEncuestaActiva().id,pregunta.id, vm.respuestasMarcadas[pregunta.id].resp);
  			
  		};
  		
  		
	}]);

	
})();