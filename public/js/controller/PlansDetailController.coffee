'use strice'

traplaApp.controller 'PlansDetailController', ['$scope', '$routeParams', 'planData', ($scope, $routeParams, planData) ->
  self = @
  $scope.$emit 'headerTitleChange', 'Plan Detail'

  self.plan = planData
  self.upd = $routeParams.upd

  $scope.$on 'ngRepeatFinished', (ngRepeatFinishedEvent) ->
    componentHandler.upgradeDom()
    # TODO 最悪。。。
    $('.js-dirty').addClass 'is-dirty'

  return self
]
