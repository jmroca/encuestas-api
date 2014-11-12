(function () {
	
	var app = angular.module('EncuestasApp', ['EncuestasApp.controllers', 'EncuestasApp.services', 'EncuestasApp.directives', 
												'ngMaterial', 'ngRoute', 'templates']);

	// configuracion de rutas
	app.config(function($routeProvider, $locationProvider) {
	  $routeProvider
	   .when('/', {
	    templateUrl: 'mainIndex.html',
	    controller: 'MainController',
	    controllerAs: 'mainCtrl'
	    
	  })
	   .when('/llenarEncuesta', {
	    templateUrl: 'llenarEncuesta.html',
	    controller: 'EncuestaController',
	    controllerAs: 'encuestaCtrl'
	    
	  })

	  });

	
})();