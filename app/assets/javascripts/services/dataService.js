(function () {
	
	'use strict';

	var app = angular.module('EncuestasApp.services', []);

	app.service('dataService', ['$http', '$log', '$q', function($http, $log, $q) {
	    
	    var encuestaActiva = {};

	    this.getCatalogo = function(catalogo) {
	        
	        var deferred = $q.defer();
	        $http.get( '/' + catalogo + '.json')
	        	.success(function(data) {
	        		deferred.resolve(data);
	        	}).error(function(msg,code) {
	        		deferred.reject(msg);
	        		$log.log(msg,code);	      
	        	});

	        return deferred.promise;
	    };


	    this.postCrearEncuesta = function(dataEncuestaNueva){

	    	// limpiar objeto de encuesta activa
	    	encuestaActiva = {};

	    	var deferred = $q.defer();

	    	$http.post('/encuestas.json', dataEncuestaNueva)
	    				.success(function(data) {
			        		deferred.resolve(data);
			        		// set objeo de encuesta activa
			        		encuestaActiva = dataEncuestaNueva;

			        	}).error(function(msg,code) {
			        		deferred.reject(msg);
			        		$log.log(msg,code);	      
			        	});

	        return deferred.promise;	

	    };


	    this.putActualizarEncuestaActiva = function() {

	    	$http.put('/encuestas/' + encuestaActiva.id + '.json', encuestaActiva);

	    };


	    this.postRespuestaMarcada= function(encuestaId,preguntaId,respuestaId) {

	    	$http.post('/detalle_encuesta.json', {encuesta_id: encuestaId, pregunta_id: preguntaId, respuesta_id:respuestaId});

	    };


	    this.getEncuestaActiva = function(){
	    	return encuestaActiva;
	    };
	    
	}]);

})();