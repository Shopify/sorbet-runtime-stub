> **DEPRECATED: This gem should not be used anymore.**
>
> As of June 2021, `sorbet-runtime-stub` is no more maintained and no further versions will be published.
>
> We decided to stop supporting this gem for multiple reasons:
> * It's not feature complete (missing T::Struct support and other Sorbet delicacies)
> * It's hard to keep up-to-date with the real sorbet-runtime
> * It provides a false sense of security for the users
>
> You should include sorbet-runtime and [disable the checks](https://sorbet.org/docs/runtime#changing-the-runtime-behavior) you don't want to apply in production env.
>
> If you're in the Shopify org, take a look at https://github.com/shopify/shopify-types.

# sorbet-runtime-stub

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

The most critical thing when loading `sorbet-runtime-stub` is to never overwrite methods defined by `sorbet-runtime`, since this would cause silent suppression of runtime type checking.

Thus, this gem will never load stub definitions if `sorbet-runtime` is present as a loadable gem in the application context. This means that on projects that do not use Bundler, this gem will not install stub definitions, if `sorbet-runtime` is installed as a gem (but it will also not load `sorbet-runtime`). On projects that use Bundler, this gem will not install stub definitions, if `sorbet-runtime` exists in the `Gemfile` for the currently running group.

Thus, if you don't want to load `sorbet-runtime` in a production environment in a Rails app, you need to use:
```ruby
if ENV['RAILS_ENV'] == 'production'
  require 'sorbet-runtime-stub'
else
  require 'sorbet-runtime'
end
```
and add `sorbet-runtime` to your `Gemfile` only for `development` and `test` groups.

If you are developing a gem that uses Sorbet in development but don't want the runtime typechecking to affect other code, you can conditionally load the runtime stubs at the top of your gem's code:
```ruby
require 'sorbet-runtime-stub' unless defined?(T)
```
You can then require the regular `sorbet-runtime` in your development-only files (e.g. test helpers, Rakefiles).

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
