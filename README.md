# MlbRb

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mlb_rb`. To experiment with that code, run `bin/console` for an interactive prompt.

I started writing this gem because I wanted to extract a piece of a rails app that I had previously used to a gem, but the API changed from the first time I used it, so I had to rewrite it anyway, so instead of starting a new rails app immediately. I figured I could kill two birds and learn to write a gem and use the new MLB API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mlb_rb'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install mlb_rb

## Usage

There are currently only two methods available:

```ruby
MlbRb.games_for_date({ date: { year: 2022, month: 3, day: 24 } })
MlbRb.games_for_date_range(
  { 
    start_date: { year: 2022, month: 3, day: 23 }, 
    end_date: { year: 2022, month: 3, day: 24 }
  }
)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mlb_rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/mlb_rb/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the MlbRb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/mlb_rb/blob/main/CODE_OF_CONDUCT.md).
