class Player
  def initialize
    @player = MPMusicPlayerController.applicationQueuePlayer
  end

  def play track_id
    Logger.log "Play #{track_id}", area: :player

    @player.setQueueWithStoreIDs([track_id])
    @player.play
  end
end