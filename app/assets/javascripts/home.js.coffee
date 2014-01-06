# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module("DogeipsumMe", ["ngResource"])

app.factory "DogeIpsum", ["$resource", ($resource) ->
  $resource("/wowdoge/:query", { query: {paragraphs: 4, lines: 0} })
]

@DogeIpsumCtrl = ["$scope", "DogeIpsum", ($scope, DogeIpsum) ->
  $scope.query = {
    paragraphs: 4,
    lines: 0
  }

  $scope.generateText = ->
    console.log("I touched this")
    DogeIpsum.query({ query: $scope.query }, (result) ->
      console.log(result)
    )
    console.log("then finished this")
]