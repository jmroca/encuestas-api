(function () {
	
	'use strict';

	var app = angular.module('EncuestasApp.controllers');

	if(!app)
		app = angular.module('EncuestasApp.controllers', []);
	
	app.controller('MainController', function(dataService, $log, $routeParams, $location) {

		// evitar uso de this fuera de contexto, usar variable vm que significa 'viewmodel'
		var vm = this;

		vm.$location = $location;
     	vm.$routeParams = $routeParams;
    	$log.log('MainController loaded!');

		vm.fechaTramite = new Date();
		vm.nombrePersona = '';
		vm.edadPersona = '';
		vm.telefonoPersona = '';
		vm.horarioTramite = {};
		vm.moduloTramite = {};
		vm.dataEncuesta = {};
		vm.encuestaCreada = false;

		// obtener datos via servicio
		dataService.getCatalogo('cat_hora')
			.then(
	           function(data) {
	           vm.dataHorarios = data;
	           vm.horarioTramite = data[0];
	           $log.log(data.length);
	          },
	          function(error) {
	           $log.log(Date.now() + ' - ERROR - calls failed, error is\n\n' + JSON.stringify(error));
	          });

		// obtener datos via servicio
		dataService.getCatalogo('cat_modulo')
			.then(
	           function(data) {
	           vm.dataModulos = data;
	           vm.moduloTramite = data[0];
	           $log.log(data.length);
	          },
	          function(error) {
	           $log.log(Date.now() + ' - ERROR - calls failed, error is\n\n' + JSON.stringify(error));
	          });

		// generar una encuesta nueva en base a valores del controlador
		vm.crearEncuesta = function(){

			$log.log('Crear Encuesta');

			dataService.postCrearEncuesta(vm.fechaTramite, vm.horarioTramite.id,vm.moduloTramite.id,vm.nombrePersona,vm.edadPersona,vm.telefonoPersona)
				.then(
					function(data){
						vm.dataEncuesta = data;
						$log.log(data.id);
						vm.encuestaCreada = true;
					},
					function(error) {
						vm.encuestaCreada = false;
						$log.log(Date.now() + ' - ERROR - calls failed, error is\n\n' + JSON.stringify(error));
					});

			
		}

	});

	
})();