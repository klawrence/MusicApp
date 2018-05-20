class Logger
  ENABLED = true

  def self.log message, options={}
    puts message if ENABLED
  end
end