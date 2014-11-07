@TransactionCtrl = ($scope, Wallet, $log, $state, $stateParams, $filter) ->
    
  #################################
  #           Private             #
  #################################
    
  $scope.didLoad = () ->
    $scope.addressBook = Wallet.addressBook
    $scope.status    = Wallet.status
    $scope.settings = Wallet.settings
    $scope.accountIndex = $stateParams.accountIndex
        
    $scope.transaction = $filter("getByProperty")("hash", $stateParams.hash, Wallet.transactions)
      
    # Restore after browser refresh (developer feature)
    if !$scope.status.isLoggedIn
      if !!$cookieStore.get("password")
        Wallet.login($cookieStore.get("uid"), $cookieStore.get("password"))
      else
        $state.go("dashboard")
        
  # First load:      
  $scope.didLoad()
  
