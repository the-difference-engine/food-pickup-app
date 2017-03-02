(function() {
  "use strict";

  angular.module("app").controller("profileCtrl",['$scope', '$http', function($scope,$http) {
    $scope.getProfiles = function() {
      $http.get("/api/v1/profiles.json").then(function(response) {
        $scope.approvedDonors = response.data.approved;
        $scope.unapprovedDonors = response.data.unapproved;
        $scope.donorCount = $scope.unapprovedDonors.length;
      });
    };

    $scope.toggleApprove = function(donor) {
        donor.approved = donor.approved ? 0 : 1;
        var donorParams = {
          id: donor.id,
          approved: donor.approved
        };
        $http.patch('/api/v1/profiles/' + donor.id + '.json', donorParams).success(function(response) {
          var index = $scope.unapprovedDonors.indexOf(donor);
          $scope.unapprovedDonors.splice(index, 1);
          $scope.approvedDonors.push(donor);
        });
        $scope.donorCount -= 1;
    };

    $scope.adminFoodPickups = function() {
      $http.get('/api/v1/food_pickups.json').then(function(response) {
        $scope.approvedPickups = response.data.approved;
        $scope.unapprovedPickups = response.data.unapproved;
      });
    };
  window.$scope = $scope;
}]);

})();
