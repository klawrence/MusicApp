class Player
  def initialize
    @player = MPMusicPlayerController.applicationQueuePlayer
  end

  def set_track track_id
    puts "set_track #{track_id}"

    @player.setQueueWithStoreIDs([track_id])
  end

  def play
    puts "play"
    @player.play
  end
end