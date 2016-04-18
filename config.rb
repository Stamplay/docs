require File.expand_path('../custom_lexers', __FILE__)
require "uglifier"


# Markdown
set :markdown_engine, :kramdown
set :markdown,
    parse_block_html: true,
    parse_span_html: true

# Assets
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :fonts_dir, 'fonts'

# Activate the syntax highlighter
activate :syntax

activate :autoprefixer do |config|
  config.browsers = ['last 2 version', 'Firefox ESR']
  config.cascade  = false
  config.inline   = true
end

# Github pages require relative links
activate :relative_assets
set :relative_links, true

# Build Configuration
configure :build do
  # If you're having trouble with Middleman hanging, commenting
  # out the following two lines has been known to help
  activate :minify_css
  activate :minify_javascript, compressor: proc {
    ::Uglifier.new(
      :mangle => {
        :toplevel => true
      },
      :compress => {
        :unsafe => false
      },
      :output => {
        :comments => :none
      }
    )
  }
  # activate :relative_assets
  # activate :asset_hash
  # activate :gzip
end
