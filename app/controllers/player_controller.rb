class PlayerController < UIViewController
  def viewDidLoad
    super

    @player = Player.new
    @player.set_track '302053341'

    self.title = 'MusicApp'
    self.view.backgroundColor = UIColor.whiteColor
    self.view.addSubview create_play_button
  end

  def create_play_button
    @play_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @play_button.setTitle('▶', forState: UIControlStateNormal)
    @play_button.font = UIFont.boldSystemFontOfSize(80.0)
    @play_button.sizeToFit
    @play_button.center = CGPointMake(self.view.frame.size.width / 2, 200)

    @play_button.when(UIControlEventTouchUpInside) do
      toggle_playback
    end

    @play_button
  end

  def toggle_playback
    if @player.playing?
      @player.pause
      @play_button.setTitle('▶', forState: UIControlStateNormal)
    else
      @player.play
      @play_button.setTitle('||', forState: UIControlStateNormal)
    end
  end
end