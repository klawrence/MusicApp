class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    playerController = PlayerController.new
    navigationController = UINavigationController.alloc.
        initWithRootViewController(playerController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    true
  end
end
