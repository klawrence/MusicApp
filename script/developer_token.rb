require 'jwt'
require 'openssl'

# Code is from https://stackoverflow.com/questions/44514221/how-to-create-a-jwt-for-use-with-apple-music

module AppleMusic
  class Token
    attr_reader :key_id, :team_id, :keyfile

    def initialize(key_id, team_id, keyfile)
      @key_id = key_id
      @team_id = team_id
      @keyfile = keyfile
    end

    def auth_token
      @auth_token ||= fetch_auth_token
    end

    def auth_header
      "Bearer #{auth_token}"
    end

    protected

    def fetch_auth_token
      now = Time.now.to_i
      one_month = 3600 * 24 * 30
      expires = now + one_month

      header = {
          typ: "JWT", # Must be specified; not in documentation
          alg: "ES256",
          kid: key_id
      }

      body = {
          iss: team_id,
          iat: now,
          exp: expires
      }

      JWT.encode(body, auth_key, 'ES256', header)
    end

    def auth_key
      key = OpenSSL::PKey::EC.new(keyfile.read)
      key.check_key
      key
    end
  end
end

team_id = '7BYEV42EFU' # Find it at https://developer.apple.com/membercenter/index.action#accountSummary
music_private_key = '45YX8PFGT6' # find it at https://developer.apple.com/account/ios/authkey/
key_file = 'key_file.p8' # path to the file you downloaded earlier

token = AppleMusic::Token.new music_private_key, team_id, File.open(key_file)
puts token.auth_token