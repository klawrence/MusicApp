class Player
  def initialize
    @player = MPMusicPlayerController.applicationQueuePlayer
  end

  def play_track track
    puts "Play #{track}"
    @player.setQueueWithStoreIDs([track_id])
    play
  end

  def play
    @player.play
  end
end
