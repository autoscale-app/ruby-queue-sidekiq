require "test_helper"

class Autoscale::Queue::TestLib < Autoscale::Queue::TestBase
  test "version" do
    refute_nil ::Autoscale::Queue::Sidekiq::VERSION
  end
end
