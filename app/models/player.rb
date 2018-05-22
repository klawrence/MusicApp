class Player
  def initialize
    @player = MPMusicPlayerController.applicationQueuePlayer
  end

  def set_track track_id
    puts "set_track #{track_id}"
    @player.setQueueWithStoreIDs([track_id])
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