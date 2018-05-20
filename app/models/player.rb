class Player
  def initialize
    @player = MPMusicPlayerController.applicationQueuePlayer
  end

  def play track_id
    puts "Play #{track_id}"

    @player.setQueueWithStoreIDs([track_id])
    @player.play
  end
end