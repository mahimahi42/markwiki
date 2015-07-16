# Markwiki

Markwiki is a Ruby gem designed to ease the development and maintenance of locally designed static sites using Markdown. Too often, at least for me, static site generators aren't intuitive to use, aren't focused for simple static sites (not blogs), or most often don't support GitHub flavoured Markdown (GFM).

Markwiki is different in that it is a tool written by me, for me. However, it may be useful for you if you want a simple static site with GFM. In fact, the ideal workflow with Markwiki is:

    Create a site with markwiki --init <NAME>
    Write website stuff (Markdown, CSS (SASS?), and JS)
    Compile and upload to your server with markwiki --launch

Simple, eh?

## Installation

**NOTE:** Markwiki is still is pre-alpha. Don't have high expectations, or really any expectations at all.

Add this line to your application's Gemfile:

```ruby
gem 'markwiki'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install markwiki

## Usage

```bash
# SIMPLE USAGE
Usage: markwiki [options]
    -i <NAME>, --init <NAME>         Create a new Markwiki site
    -v, --version                    Show the Markwiki version number
    -h, --help                       Display this help menu
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mahimahi42/markwiki. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

