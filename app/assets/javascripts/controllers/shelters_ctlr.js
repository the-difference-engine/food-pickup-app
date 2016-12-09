(function() {
  "use strict";

  angular.module("app").controller("sheltersCtrl", ['$scope', '$http', '$timeout', function($scope, $http, $timeout) {
    $scope.allShelters = function() {
      $http.get('/api/v1/shelters.json').then(function(response) {
        $scope.shelters = response.data;
      });
    };

    $scope.addShelter = function(shelter){
      var params = {
        name: shelter.name,
        phone_number: shelter.phone_number,
        email: shelter.email,
        address: shelter.address
      };
        $http.post('/api/v1/shelters', params).then(function(response) {
          if (response.data.success) {
            $scope.success = response.data.success;
            $scope.shelters.push(params);
            shelter.name = '';
            shelter.phone_number = '';
            shelter.email = '';
            shelter.address = '';
            $timeout(function() {
              $scope.success = null;
            }, 3000);
          }
          else {
            $scope.error = response.data.danger;
          }
      });
    };
    $scope.removeShelter = function(ind){
      var shelter = $scope.shelters[ind];
      $http.delete("/api/v1/shelters/"+shelter.id+"").then(function(response) {
        $scope.shelters.splice(ind, 1);
      });
    };
}]);
})();
