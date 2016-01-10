'user strict'

traplaApp.controller 'PlansCreateController', ['$scope', '$location', 'Plan', ($scope, $location, Plan) ->
  self = @
  $scope.$emit 'headerTitleChange', 'Create'

  $scope.$on 'ngRepeatFinished', (ngRepeatFinishedEvent) ->
    componentHandler.upgradeDom()
    idx = self.plan.details.length - 1
    $('#started_at_' + idx).datetimepicker {
      step: 15,
      onChangeDateTime: (dp, $input) ->
        self.plan.details[idx].started_at = $input.val()
        $input.parent().addClass 'is-dirty'
    }

  self.plan = {}

  if typeof self.plan.details == 'undefined'
    self.plan.details = [{started_at: null, place: null, content: null}]

  self.addDetail = () ->
    self.plan.details.push {started_at: null, place: null, content: null}

  self.create = () ->
    plan = new Plan self.plan
    plan.$create().then (data) ->
      $location.path '/plans/' + data.id

  return self
]
