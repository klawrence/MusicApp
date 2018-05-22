class SearchController < UITableViewController
  attr_accessor :player

  def viewDidLoad
    super

    @tracks = []

    @search = MusicSearch.new
    @search.search_for_tracks('funny valentine') do |tracks|
      @tracks = tracks
      tableView.reloadData
    end

    self.title = 'Search'
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @tracks.count
  end

  REUSE_ID = 'tracks'
  def tableView(tableView, cellForRowAtIndexPath: path)
    cell = tableView.dequeueReusableCellWithIdentifier(REUSE_ID)
    unless cell
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier: REUSE_ID)
    end

    track = @tracks[path.row]
    cell.textLabel.text = track.name
    cell.detailTextLabel.text = track.artist

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: path)
    puts "select row at #{path.row}"
    @player.set_track @tracks[path.row]
    @play.play
  end

end