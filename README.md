# Ruby Queue Sidekiq (Autoscale.app)

Produces [Sidekiq] queue metrics for the [Autoscale.app] [Agent].

## Installation

Add the gem to your `Gemfile`:

    bundle add autoscale-queue-sidekiq --version "~> 0"

## Usage

Instructions are provided during the autoscaler setup process on [Autoscale.app].

## Development

Prepare environment:

    bin/setup

See Rake for relevant tasks:

    bin/rake -T

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/autoscale-app/ruby-queue-sidekiq

[Autoscale.app]: https://autoscale.app
[Agent]: https://github.com/autoscale-app/ruby-agent
[Sidekiq]: https://sidekiq.org
