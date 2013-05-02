# encoding: utf-8
class SportsFeed
  include Mongoid::Document
  include Mongoid::Timestamps

  field :channel
  field :items, type: Array
  field :feed_type
end