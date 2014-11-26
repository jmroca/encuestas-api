(function () {
	
	'use strict';

	var app = angular.module('EncuestasApp.controllers');

	if(!app)
		app = angular.module('EncuestasApp.controllers', ['ngMaterial']);
	
	app.controller('MainController',[ 'dataService', '$log', '$mdToast', '$location', '$mdSidenav', '$rootScope',
		function(dataService, $log, $mdToast, $location, $mdSidenav, $rootScope) {

		// evitar uso de this fuera de contexto, usar variable vm que significa 'viewmodel'
		var vm = this;

		vm.$location = $location;
     	$log.log('MainController loaded!');

		vm.encuestaCreada = false;
		vm.selectedTab = 0;
		
		// objeto que almacena la encuestra creada
		vm.encuestaNueva = {
					id: 0,
					cat_modulo_id: 1,
					cat_hora_id: 1,
					fechaTramite: new Date(),
					nombre: "",
					edad: null,
					telefono: "",
					observaciones: ""
				};

		// obtener datos via servicio
		dataService.getCatalogo('cat_hora')
			.then(
	           function(data) {
	           vm.dataHorarios = data;
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
	           $log.log(data.length);
	          },
	          function(error) {
	           $log.log(Date.now() + ' - ERROR - calls failed, error is\n\n' + JSON.stringify(error));
	          });

		// generar una encuesta nueva en base a valores del controlador
		vm.crearEncuesta = function(){

			$log.log('Crear Encuesta');

			$log.log('Fecha Tramite: ' + vm.encuestaNueva.fechaTramite);

			dataService.postCrearEncuesta(vm.encuestaNueva)
				.then(
					function(data){
						
						// asociamos objeto de binding a data devuelta por API
						vm.encuestaNueva.id = data.id;

						$log.log(vm.encuestaNueva.id);
						
						// cambiar a tab de responder encuesta
						vm.selectedTab = 1;
						
					},
					function(error) {
						vm.encuestaCreada = false;
						vm.selectedTab = 0;
						$log.log(Date.now() + ' - ERROR - calls failed, error is\n\n' + JSON.stringify(error));
					});
			
			// activar tabs 
			vm.encuestaCreada = true;
			
		}


		vm.actualizarDatosEncuesta = function(){

			$log.log(dataService.getEncuestaActiva().observaciones);

			dataService.putActualizarEncuestaActiva();

			$mdToast.show($mdToast.simple().content('Actualizacion de Datos Realizada!'));
		}

		
		// resetear objetos utilizados para almacenar data de encuesta activa.
		vm.resetDataEncuesta = function(){

			// indicar a otro controlador que debe resetear la data.
			$rootScope.$emit('RESET_DATA');

			// limpiar objeto que almacena la encuestra creada
			vm.encuestaNueva = {
						id: 0,
						cat_modulo_id: 1,
						cat_hora_id: 1,
						fechaTramite: new Date(),
						nombre: "",
						edad: null,
						telefono: "",
						observaciones: ""
				};

			// resetear bandera para permitir nueva encuesta.
			vm.encuestaCreada = false;
		}


 		vm.openLeftMenu = function() {
    		$mdSidenav('left').toggle();
  		}


	}]);

	
	
})();