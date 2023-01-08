require "test_helper"

class Autoscale::Queue::TestLatency < Autoscale::Queue::TestBase
  test "no latency" do
    WorkJob.perform_async
    assert_equal 0, ::Autoscale::Queue::Sidekiq.latency(:default)
  end

  test "3 second latency" do
    WorkJob.perform_async
    Timecop.travel(3)
    assert_equal 3, ::Autoscale::Queue::Sidekiq.latency(:default)
  end

  test "3 second latency between the two queues" do
    WorkJob.perform_async
    Timecop.travel 1
    OtherJob.perform_async
    Timecop.travel 2
    assert_equal 3, Autoscale::Queue::Sidekiq.latency # implicit all queues
    assert_equal 3, Autoscale::Queue::Sidekiq.latency(:default, :other)
  end
end
