# sorbet-runtime-stub

[![Build status](https://badge.buildkite.com/914aeee9240a3a0c0334c1050aed6bdb1ad1141fb18a038436.svg)](https://buildkite.com/shopify/sorbet-runtime-stub)

This gem provides stub definitions for all the `T` namespace that Sorbet type signatures need for runtime. This is appropriate for people who want nothing to do with `sorbet-runtime` when their code is being run.

**Disclaimer**: This gem is being used in our applications but there are some still features missing and it may have some sharp edges.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sorbet-runtime-stub'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install sorbet-runtime-stub

## Usage

Your code should decide to switch between requiring `sorbet-runtime` or `sorbet-runtime-stub`.

For example, if you don't want to load `sorbet-runtime` in a production environment in a Rails app, you can use:
```ruby
if ENV['RAILS_ENV'] == 'production'
  require 'sorbet-runtime-stub'
else
  require 'sorbet-runtime'
end
```

## Missing features

Some feature from sorbet-runtime like `T::Enum` and `T::Struct` as still not supported.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Shopify/sorbet-runtime-stub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Shopify/sorbet-runtime-stub/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sorbet::Runtime::Stub project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Shopify/sorbet-runtime-stub/blob/master/CODE_OF_CONDUCT.md).
