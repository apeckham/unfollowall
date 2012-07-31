Bundler.require

raise "Missing env var" if %w[TWITTER_CONSUMER_KEY TWITTER_CONSUMER_SECRET TWITTER_OAUTH_TOKEN TWITTER_OAUTH_TOKEN_SECRET].find { |key| ENV[key].nil? }

SLEEP = 86400 / 200

puts "start"

friend_ids = []

loop do
  if friend_ids.empty?
    puts "get friend ids"
    friend_ids = Twitter.friend_ids.ids
  end

  id = friend_ids.pop
  puts "unfollow #{id}"
  Twitter.unfollow id
  
  puts "sleep #{SLEEP}"
  sleep SLEEP
end