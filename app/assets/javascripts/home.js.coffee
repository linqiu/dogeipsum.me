# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module("DogeipsumMe", ["ngResource"])

app.factory "DogeIpsum", ["$resource", ($resource) ->
  $resource("/wowdoge/", {})
]

INTEGER_REGEXP = /^\-?\d+$/
app.directive "integer", ->
  require: "ngModel"
  link: (scope, elm, attrs, ctrl) ->
    ctrl.$parsers.unshift (viewValue) ->
      if INTEGER_REGEXP.test(viewValue)
        # it is valid
        ctrl.$setValidity "integer", true
        viewValue
      else
        # it is invalid, return undefined (no model update)
        ctrl.$setValidity "integer", false
        `undefined`

@DogeIpsumCtrl = ["$scope", "DogeIpsum", ($scope, DogeIpsum) ->
  $scope.query = {
    paragraphs: 1,
    lines: 0
  }

  $scope.generateText = ->
    clean_params = cleanUpParams($scope.query)
    DogeIpsum.get({ query : clean_params }, (result) ->
      $scope.lorem = result.lorem
    )

  cleanUpParams = (query)->
    para = if isNaN(parseInt(query.paragraphs)) then 1 else query.paragraphs
    lines = if isNaN(parseInt(query.lines)) then 0 else query.lines
    { paragraphs: para, lines: lines}
]