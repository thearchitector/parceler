# Parceler
![version](https://img.shields.io/gem/v/parceler.svg?label=version&style=flat-square)
![downloads](https://img.shields.io/gem/dv/parceler/stable.svg?label=downloads&style=flat-square)

Parceler attempts to be an alternative asset compiler and manager for [Ruby on Rails](https://rubyonrails.org/). It provides functionality similar to Rails' own [Webpacker gem](https://github.com/rails/webpacker), but is powered by [Parcel](https://parceljs.org/) rather than [Webpack](https://webpack.js.org/). While meant for Rails, nothing inhibits using this gem outside of a Rails context.

## Installation
You can install this gem by adding it to your application's `Gemfile`:

```ruby
gem 'parceler', group: :development
```

It is also recommended that you create an config file so you can customize this gem's behavior to align with your own app. You can generate the default configuration initializer by running:

```sh
  $ rails g parceler
```