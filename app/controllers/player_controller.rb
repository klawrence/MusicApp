class PlayerController < UIViewController

  def viewDidLoad
    super

    @player = Player.new
    @search_controller = SearchController.new
    @search_controller.player = @player

    self.title = 'MusicApp'
    self.view.backgroundColor = UIColor.whiteColor

    self.view.addSubview create_play_button
    self.navigationItem.rightBarButtonItem = create_search_button
  end

  def create_search_button
    @search_button = BW::UIBarButtonItem.new(system: :search) do
      self.navigationController.pushViewController(@search_controller, animated: true)
    end
  end

  def create_play_button
    @play_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @play_button.setTitle('▶', forState: UIControlStateNormal)
    @play_button.font = UIFont.boldSystemFontOfSize(80.0)
    @play_button.sizeToFit
    @play_button.center = CGPointMake(self.view.frame.size.width / 2, 200)

    @play_button.when(UIControlEventTouchUpInside) do
      @player.play '302053341'
    end

    @play_button
  end
end