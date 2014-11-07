(function () {
	
	'use strict';

	var app = angular.module('services', []);

	//service style, probably the simplest one
	app.service('dataService', function($http, $log, $q) {
	    
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

	    this.postRespuestaMarcada= function(encuestaid,preguntaid,respuestaid) {

	    	$http.post('/detalle_encuesta.json', {encuesta_id: encuestaid, pregunta_id: preguntaid, respuesta_id:respuestaid});

	    }
	});

})();