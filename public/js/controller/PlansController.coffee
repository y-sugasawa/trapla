'use strice'

traplaApp.controller 'PlansController', ['$scope', '$location', 'Plan', ($scope, $location, Plan) ->
  self = @
  $scope.$emit 'headerTitleChange', 'Plan'
  $scope.$on 'ngRepeatFinished', (ngRepeatFinishedEvent) ->
    componentHandler.upgradeDom()

  self.goDetail = (id) ->
    $location.path '/plans/' + id

  self.plans = []
  Plan.all().$promise.then (plans) ->
    self.plans = plans

  return self
]
