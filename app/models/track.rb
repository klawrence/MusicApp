class Track
  attr_reader :id, :name, :artist
  def initialize json
    attributes = json['attributes']

    @id = json['id']
    @name = attributes['name']
    @artist = attributes['artistName']
  end

  def to_s
    "#{name} - #{artist}"
  end
end
