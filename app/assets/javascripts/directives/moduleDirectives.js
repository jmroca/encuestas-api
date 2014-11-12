(function () {
	
	'use strict';

	var	app = angular.module('EncuestasApp.directives', []);
	
	app.directive('llenarEncuesta', function(){
		return{
			restrict: 'E',
			templateUrl: 'llenarEncuesta.html',
			controller: 'EncuestaController',
			controllerAs: 'encuestaCtrl'
		};
	});
	

	app.directive('mostrarEncuesta', function(){
		return{
			restrict: 'E',
			templateUrl: 'showEncuesta.html',
			controller: 'EncuestaController',
			controllerAs: 'encuestaCtrl'
		};
	});

	
})();