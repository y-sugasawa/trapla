'use strict'

traplaApp.controller 'IndexController', ['$scope', '$location', ($scope, $location) ->
  self = @
  $scope.$emit 'headerTitleChange', 'Home'

  self.clickSideMenu = (path) ->
    $location.path path

  $scope.$on 'headerTitleChange', (event, title) ->
    self.headerTitle = title

  return self
]
