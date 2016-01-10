'use strict'

traplaApp.controller 'HomeController', ['$scope', ($scope) ->
  self = @
  $scope.$emit 'headerTitleChange', 'Home'

]
