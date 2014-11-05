(function () {
	
	'use strict';

	var app = angular.module('controllers', []);

	app.controller('MainController', function(dataService, $log, $routeParams, $location) {

		// evitar uso de this fuera de contexto, usar variable vm que significa 'viewmodel'
		var vm = this;

		vm.$location = $location;
     	vm.$routeParams = $routeParams;
    	$log.log('Hello World!');

		vm.title = 'Encuestas Satisfaccion';

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

  		
  		vm.logRespuesta = function(pregunta){

  			$log.log(pregunta.id);
  			$log.log('Resp:' + vm.respuestasMarcadas[pregunta.id].resp);
  			
  		};
	});

	
})();