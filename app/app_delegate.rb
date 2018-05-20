class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    BubbleWrap.use_weak_callbacks = true

    player_controller = PlayerController.new
    search_controller = SearchController.new

    tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    tab_controller.viewControllers = [player_controller, search_controller]

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = tab_controller
    @window.makeKeyAndVisible

    true
  end
end
