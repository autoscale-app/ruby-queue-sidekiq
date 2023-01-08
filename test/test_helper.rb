$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "autoscale/queue/sidekiq"
require "minitest/autorun"
require "redis"
require "timecop"

class WorkJob
  include Sidekiq::Job
  sidekiq_options queue: :default

  def perform
  end
end

class OtherJob
  include Sidekiq::Job
  sidekiq_options queue: :other

  def perform
  end
end

class Autoscale::Queue::TestBase < Minitest::Test
  def setup
    Timecop.return
    Sidekiq.configure_server { |config| config.redis = {url: url} }
    Sidekiq.configure_client { |config| config.redis = {url: url} }
    Redis.new(url: url).flushdb
  end

  def url
    "redis://0.0.0.0:6379/12"
  end

  def self.test(name, &block)
    test_name = "test_#{name.gsub(/\s+/, "_")}".to_sym

    if method_defined?(test_name)
      raise "#{test_name} is already defined in #{self}"
    else
      define_method(test_name, &block)
    end
  end
end
