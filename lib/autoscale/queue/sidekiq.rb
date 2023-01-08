require_relative "sidekiq/version"

require "sidekiq/api"

module Autoscale
  module Queue
    module Sidekiq
      def latency(*queues)
        queues = ::Sidekiq::Queue.all.map(&:name) if queues.empty?
        queues.map { |queue| ::Sidekiq::Queue.new(queue).latency }.max.round
      end

      module_function :latency
    end
  end
end
