require 'rubygems'
require 'sitemap_generator'
require './config/environment/'


# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.lofirefly.com"
# ###################################################################
# http://www.jademind.com/blog/posts/updating-sitemap-file-on-heroku
# 
# Run => heroku run rake sitemap:create
# 
# pick a place safe to write the files
SitemapGenerator::Sitemap.public_path = 'tmp/'

# store on S3 using Fog
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new

# inform the map cross-linking where to find the other maps
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"

# pick a namespace within your bucket to organize your maps
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Notice the below if you're hosting Jekyll/Octopress in a subdirectory
  # or otherwise want to index content outside of Rails' routes.
  # add_to_index '/path/sitemap.xml' 
  add '/portfolio_images'
  add '/about_leah'
  add '/details'
  add '/contacts/new'
  
  add '/posts', :priority => 0.7, :changefreq => 'daily'

  Post.find_each do |post|
    add post_path(post), :lastmod => post.updated_at
  end
end