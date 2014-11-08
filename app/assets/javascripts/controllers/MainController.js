(function () {
	
	'use strict';

	var app = angular.module('controllers', []);

	app.controller('MainController', function(dataService, $log, $routeParams, $location) {

		// evitar uso de this fuera de contexto, usar variable vm que significa 'viewmodel'
		var vm = this;

		vm.$location = $location;
     	vm.$routeParams = $routeParams;
    	$log.log('MainController loaded!');

		vm.fechaTramite = new Date();
		vm.horaTramite = 0;
		vm.nombrePersona = '';
		vm.edadPersona = '';
		vm.telefonoPersona = '';
		vm.horarioTramite = {};
		vm.moduloTramite = {};

		vm.crearEncuesta = function(){
			return 1;
		}

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


	});

	
})();