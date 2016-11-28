(function() {
  "use strict";

  angular.module("app").controller("foodPickupCtrl", ['$scope', '$http', function($scope, $http) {
    $scope.adminFoodPickups = function() {
      $http.get('/api/v1/food_pickups.json').then(function(response) {
        $scope.donorPickups = response.data.approved;
      });
    };
  }]);
})();
