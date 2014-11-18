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

	    this.postCrearEncuesta = function(pfechaTramite,phoraId,pmoduloId,pnombre,pedad,ptelefono){

	    	// limpiar objeto de encuesta activa
	    	encuestaActiva = {};

	    	var deferred = $q.defer();

	    	$http.post('/encuestas.json', {fechaTramite: pfechaTramite
	    									, cat_hora_id: phoraId
	    									, cat_modulo_id: pmoduloId
	    									, nombre: pnombre
	    									, edad: pedad
	    									, telefono: ptelefono})
	    				.success(function(data) {
			        		deferred.resolve(data);
			        		// set objeo de encuesta activa
			        		encuestaActiva = data;
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