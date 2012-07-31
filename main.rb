Bundler.require

raise "Missing env var" if %w[TWITTER_CONSUMER_KEY TWITTER_CONSUMER_SECRET TWITTER_OAUTH_TOKEN TWITTER_OAUTH_TOKEN_SECRET].find { |key| ENV[key].nil? }

SLEEP = 86400 / 200

friend_ids = []

loop do
  friend_ids = Twitter.friend_ids.ids if friend_ids.empty?

  id = friend_ids.pop
  puts "unfollow #{id}"
  Twitter.unfollow id
  
  puts "sleep #{SLEEP}"
  sleep SLEEP
end