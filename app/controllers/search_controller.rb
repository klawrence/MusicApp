class SearchController < UITableViewController
  attr_accessor :player

  def viewDidLoad
    super

    @tracks = []
    @search = MusicSearch.new

    create_search_bar

    self.title = 'Search'
  end

  def create_search_bar
    @search_ui = UISearchController.alloc.initWithSearchResultsController(nil)
    @search_ui.dimsBackgroundDuringPresentation = false
    @search_ui.searchBar.sizeToFit
    @search_ui.searchResultsUpdater = self

    tableView.tableHeaderView = @search_ui.searchBar
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
    @player.play
  end

  def updateSearchResultsForSearchController search_controller
    terms = search_controller.searchBar.text
    puts "search terms: #{terms}"
    @search.search_for_tracks(terms) do |tracks|
      @tracks = tracks
      tableView.reloadData
    end
  end


end