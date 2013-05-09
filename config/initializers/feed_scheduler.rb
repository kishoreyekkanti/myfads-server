require 'rubygems'
require 'rufus/scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.every '15m' do
  FeedParser.parse_and_save
  puts "fetched the feed @ "+Time.now.to_s
end