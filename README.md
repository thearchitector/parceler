# Parceler
[![version](https://img.shields.io/gem/v/parceler.svg?label=version&style=flat-square)
![downloads](https://img.shields.io/gem/dt/parceler.svg?style=flat-square)](https://rubygems.org/gems/parceler)
[![license](https://img.shields.io/github/license/thearchitectoR/parceler.svg?style=flat-square)](/LICENSE)

Parceler attempts to be an alternative asset compiler and manager for [Ruby on Rails](https://rubyonrails.org/). It provides functionality similar to Rails' own [Webpacker gem](https://github.com/rails/webpacker) but is powered by [Parcel](https://parceljs.org/) instead of [Webpack](https://webpack.js.org/). As a result and at the cost of some more advanced features, it requires significantly less out-of-the-box configuration. While meant for Rails, nothing inhibits using this gem outside of a Rails context.

## Installation
You can install this gem by adding it to your application's `Gemfile` via:

```ruby
  gem 'parceler', group: :development
```

This gem also requires a Node.js environment set up with Yarn. You can install Node.js at https://nodejs.org/en/download/ and Yarn at https://yarnpkg.com/en/docs/install.

To install the required Node packages, run the rake task `parceler:install`:

```sh
  $ bundle exec rake parceler:install
```

### Configuration
Before this gem can bundle your app's assets, it must be configured. To do so, you must run `Parceler.configure` with a provided configuration block _before_ starting your app's server. The default configuration block that is packaged with this gem looks something like this:

```rb
# Configuration options defined here have direct relations to those defined in the official documentation.
# https://parceljs.org/cli.html
Parceler.configure do |c|
    c.entry_point = "app/javascript/application.js"
    c.destination = "public/parcels"
    c.cache = nil
    c.source_maps = false
    c.autoresolve = false

    # The following options only have an effect in production builds. You can parcel
    # your assets for production with rake tasks `parceler:build` or `assets:precompile`.
    c.minify = true
    c.content_hashing = true
    c.tree_shaking = false
end
```

If you do not want to customize your app, you may simply copy this block and everythig should work fine. _However_, it is very likely that you will need to customize it to your particular needs.

#### Configuration on Rails
While the above steps are not explicitly required, it is _highly_ recommended that you create a config file so you can customize this gem to align with your own app. You can generate the default configuration initializer by running

```sh
  $ rails g parceler
```

, which will place a new file at `config/initializers/parceler.rb`.

## Origin Story
I built this gem while working on the MAIS™ business managment and information system developed by [sdbase](sdbase.com). At the time of development, we were looking at upgrading the entire stack from EOLed versions of Ruby and Rails. Throughout the process, I realized that the new asset management system (`webpacker`) was overly complicated for many of our applications. As a result, it provided a reasonably steep learning curve to many of the burgeoning developers with which we were working. To mitigate those problems and to simplify the engineering learning process, I built Parceler to require very little out-of-the-box configuration while maintaining very transparent functionality.

## License
This gem is released and published under the [3-Clause BSD License](https://opensource.org/licenses/BSD-3-Clause) by Elias Gabriel (@thearchitector).
