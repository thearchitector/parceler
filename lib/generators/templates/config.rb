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
end