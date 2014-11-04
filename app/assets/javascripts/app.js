(function () {
	
	var app = angular.module('testapp', ['ngMaterial', 'ngRoute', 'templates']);

	app.controller('MainController', function($scope, $log, $routeParams, $location) {

		$scope.$log = $log;
    	$scope.$location = $location;
     	$scope.$routeParams = $routeParams;
    	$scope.$log.log('Hello World!');

		$scope.title = 'Testing AngularJS 1.3';
		$scope.dataRespuestas = respuestas;
		$scope.dataPreguntas = preguntas;

		$scope.respuestasMarcadas = [
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

  		$scope.radioData = [
    		{ label: 'Muy Bueno', value: '1' },
		    { label: 'Bueno', value: '2' },
		    { label: 'Necesita Mejorar', value: '3' },
		    { label: 'Malo', value: '4'}

  		];

  		$scope.logRespuesta = function(pregunta){

  			$scope.$log.log(pregunta.id);
  			$scope.$log.log('Resp:' + this.respuestasMarcadas[pregunta.id].resp);
  			this.respuestasMarcadas[pregunta.id].resp = '4';
  		};
	});

	app.config(function($routeProvider, $locationProvider) {
	  $routeProvider
	   .when('/', {
	    templateUrl: 'mainIndex.html',
	    controller: 'MainController'
	    
	  })

	  });

	preguntas = [{"id":1,"descripcion":"La atencion del personal de Transito fue:","url":"http://localhost:3000/pregunta/1.json"},{"id":2,"descripcion":"La atención del personal del Banco fue","url":"http://localhost:3000/pregunta/2.json"},{"id":3,"descripcion":"La atención del personal de la Optica fue","url":"http://localhost:3000/pregunta/3.json"},{"id":4,"descripcion":"La atención del personal de la Escuela de Manejo fue","url":"http://localhost:3000/pregunta/4.json"},{"id":5,"descripcion":"El trato de las personas que le atendieron fue","url":"http://localhost:3000/pregunta/5.json"},{"id":6,"descripcion":"La presentación de las personas que le atendieron fue","url":"http://localhost:3000/pregunta/6.json"},{"id":7,"descripcion":"El orden del tramite fue","url":"http://localhost:3000/pregunta/7.json"},{"id":8,"descripcion":"La limpieza y las instalaciones en general son","url":"http://localhost:3000/pregunta/8.json"},{"id":9,"descripcion":"El tiempo del tramite después de su pago en el Banco fue","url":"http://localhost:3000/pregunta/9.json"},{"id":10,"descripcion":"El servicio prestado en general fue","url":"http://localhost:3000/pregunta/10.json"},{"id":11,"descripcion":"La calidad del documento proporcionado es","url":"http://localhost:3000/pregunta/11.json"}];
	respuestas = [{"id":1,"descripcion":"Muy Bueno","imagen":null},{"id":2,"descripcion":"Bueno","imagen":""},{"id":3,"descripcion":"Necesita Mejorar","imagen":""},{"id":4,"descripcion":"Malo","imagen":""}];

})();