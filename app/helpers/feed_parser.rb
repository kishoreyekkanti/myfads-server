require 'feedzirra'

class FeedParser
  GLOBAL_CRICKET_NEWS_FEED = "http://www.espncricinfo.com/rss/content/story/feeds/0.xml"
  LIVE_SCORES_FEED = "http://static.cricinfo.com/rss/livescores.xml"
  INDIA_NEWS_FEED = "http://www.espncricinfo.com/rss/content/story/feeds/6.xml"
  MORE_NEWS_FEED = "http://www.espncricinfo.com/rss/content/story/feeds/page2.xml"


  def parse_and_save
    feeds = [GLOBAL_CRICKET_NEWS_FEED, LIVE_SCORES_FEED, INDIA_NEWS_FEED, MORE_NEWS_FEED]
    feeds.each do |feed|
      parsed_feed = Feedzirra::Feed.fetch_and_parse(feed)
      items = []
      parsed_feed.entries.each do |entry|
        items << Hash[:title, entry.title, :description, entry.summary, :url, entry.url,
                     :guid, entry.entry_id]

      end
      data_hash = {:channel => parsed_feed.url, :items => items, :feed_type => feed}
      SportsFeed.create!(data_hash)
    end
  end

end