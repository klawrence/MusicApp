class Player
  def initialize
    @player = MPMusicPlayerController.applicationQueuePlayer
  end

  def set_track track
    puts "set_track #{track}"
    @player.setQueueWithStoreIDs([track.id])
  end

  def play
    puts 'play'
    @player.play
  end

  def pause
    puts 'pause'
    @player.pause
  end

  def playing?
    @player.playbackState == MPMusicPlaybackStatePlaying
  end
end