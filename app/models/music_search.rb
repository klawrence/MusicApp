class MusicSearch
  TOKEN = 'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImFsZyI6IkVTMjU2Iiwia2lkIjoiNDVZWDhQRkdUNiJ9.eyJpc3MiOiI3QllFVjQyRUZVIiwiaWF0IjoxNTI2ODYwMjk5LCJleHAiOjE1Mjk0NTIyOTl9.yQxKkTYuwC3EZeSt6B9YL7wwPGrqQReigCWv-LpuY9xPrn9YHQSsX0luPgySkwxCabnr4jbB_BsY6LamrDePiw'

  def initialize
    @storefront = 'us' # use the correct storefront for where you have your Apple account. E.g. 'uk', 'de', 'fr'.

    @apple = AFMotion::Client.build("https://api.music.apple.com/v1/catalog/#{@storefront}/search") do
      header 'Accept', 'application/json'
      header 'Authorization', "Bearer #{TOKEN}"

      response_serializer :json
    end
  end

  def search_for_tracks terms, &block
    terms = terms.tr(' ', '+')
    fetch_json("?types=songs&term=#{terms}") do |json|
      if json['results'].any?
        data = json['results']['songs']['data']
        tracks = data.map {|track_json| Track.new(track_json)}
        block.call(tracks) if block
      end
    end
  end

  def fetch_json(url, &block)
    @apple.get(url) do |result|
      if result.success?
        block.call result.object
      else
        puts result.error.localizedDescription
      end
    end
  end
end

example = {
    "results"=>{
        "songs"=>{
            "data"=>[
                {
                    "id"=>"980043031",
                    "type"=>"songs",
                    "href"=>"/v1/catalog/us/songs/980043031",
                    "attributes"=>{
                        "discNumber"=>1,
                        "name"=>"My Funny Valentine",
                        "albumName"=>"Pure Ella",
                        "releaseDate"=>"1956-01-01",
                        "trackNumber"=>10,
                        "previews"=>[
                            {
                                "url"=>"https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/Music3/v4/7f/a4/fc/7fa4fc77-59fd-56e2-e8d7-b33dfca506ec/mzaf_1540407110046418090.plus.aac.p.m4a"
                            }
                        ],
                        "composerName"=>"Richard Rodgers & Lorenz Hart",
                        "url"=>"https://itunes.apple.com/us/album/my-funny-valentine/980043019?i=980043031",
                        "isrc"=>"USWWW0139451",
                        "playParams"=>{
                            "id"=>"980043031",
                            "kind"=>"song"
                        },
                        "durationInMillis"=>234467,
                        "genreNames"=>["Jazz", "Music"],
                        "artwork"=>{
                            "height"=>1500,
                            "textColor3"=>"363735",
                            "textColor4"=>"3a3834",
                            "textColor2"=>"1a1a16",
                            "width"=>1500,
                            "textColor1"=>"161917",
                            "bgColor"=>"b8afb0",
                            "url"=>"https://is4-ssl.mzstatic.com/image/thumb/Music2/v4/8c/63/4c/8c634c93-2e13-9592-88cc-2942301bb4ac/source/{w}x{h}bb.jpg"
                        },
                        "artistName"=>"Ella Fitzgerald"
                    }
                },
                {
                    "id"=>"730297207",
                    "type"=>"songs",
                    "href"=>"/v1/catalog/us/songs/730297207",
                    "attributes"=>{
                        "discNumber"=>1,
                        "name"=>"My Funny Valentine",
                        "albumName"=>"Classic Sinatra: His Great Performances 1953-1960",
                        "releaseDate"=>"2000-03-02",
                        "trackNumber"=>4,
                        "previews"=>[
                            {
                                "url"=>"https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview71/v4/ec/e6/ec/ece6ecaa-bf75-7030-871e-a49c1b427a01/mzaf_4743287622240461034.plus.aac.p.m4a"
                            }
                        ],
                        "url"=>"https://itunes.apple.com/us/album/my-funny-valentine/730297130?i=730297207",
                        "isrc"=>"USCA29800471",
                        "playParams"=>{
                            "id"=>"730297207",
                            "kind"=>"song"
                        },
                        "durationInMillis"=>151107,
                        "genreNames"=>[
                            "Pop", "Music", "Vocal", "Vocal Pop", "Jazz", "Vocal Jazz", "Standards", "Traditional Pop", "Easy Listening", "Swing", "Rock"
                        ],
                        "artwork"=>{
                            "height"=>1401,
                            "textColor3"=>"383a3c",
                            "textColor4"=>"53586d",
                            "textColor2"=>"2f3249",
                            "width"=>1401,
                            "textColor1"=>"0d0c0d",
                            "bgColor"=>"e5f2fa",
                            "url"=>"https://is4-ssl.mzstatic.com/image/thumb/Music6/v4/31/a9/4b/31a94bbe-f356-27a0-41a6-df8392c95efb/source/{w}x{h}bb.jpg"
                        },
                        "artistName"=>"Frank Sinatra"}
                }
            ],
            "href"=>"/v1/catalog/us/search?term=funny+valentine&types=songs",
            "next"=>"/v1/catalog/us/search?offset=6&term=funny+valentine&types=songs"
        }
    }
}


{
  "results"=>{
    "songs"=>{
      "data"=>[
        {
          "id"=>"980043031",
          "attributes"=>{
            "name"=>"My Funny Valentine",
            "artwork"=>{
              "url"=>"https://is4-ssl.mzstatic.com/image/thumb/Music2/v4/8c/63/4c/8c634c93-2e13-9592-88cc-2942301bb4ac/source/{w}x{h}bb.jpg"
            },
            "artistName"=>"Ella Fitzgerald"
          }
        },
        {
          "id"=>"730297207",
          "attributes"=>{
            "name"=>"My Funny Valentine",
            "artwork"=>{
              "url"=>"https://is4-ssl.mzstatic.com/image/thumb/Music6/v4/31/a9/4b/31a94bbe-f356-27a0-41a6-df8392c95efb/source/{w}x{h}bb.jpg"
            },
            "artistName"=>"Frank Sinatra"}
        }
      ]
    }
  }
}
