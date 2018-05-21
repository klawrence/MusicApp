class Track
  attr_reader :id, :name, :artist, :artwork_url
  def initialize json
    attributes = json['attributes']

    @id = json['id']
    @name = attributes['name']
    @artist = attributes['artistName']
    @artwork_url = attributes['artwork']['url']
  end

  def to_s
    "#{name} - #{artist}"
  end
end
