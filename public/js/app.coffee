'use strict'

traplaApp = angular.module 'traplaApp', ['ngRoute', 'ngResource']

traplaApp.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when '/', { templateUrl: 'home/index.html', controller: 'HomeController as home'}
    .when '/plans/create', { templateUrl: 'plans/create.html', controller: 'PlansCreateController as planCreate'}
    .when '/plans', { templateUrl: 'plans/index.html', controller: 'PlansController as plan'}
    .when '/plans/:id/:upd?', {
      templateUrl: 'plans/detail.html',
      controller: 'PlansDetailController as planDetail',
      resolve: { 'planData': ['$route', 'Plan', ($route, Plan) ->
        return Plan.find {id: $route.current.params.id}
      ] }
    }
    .otherwise {redirectTo: '/'}
]

traplaApp.run ['$rootScope', '$location', '$timeout', ($rootScope, $location, $timeout) ->
  $rootScope.$on '$viewContentLoaded', () ->
    $timeout () ->
      componentHandler.upgradeAllRegistered()
]

window.traplaApp = traplaApp
