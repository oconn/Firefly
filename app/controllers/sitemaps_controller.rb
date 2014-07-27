class SitemapsController < ApplicationController

  def show
    # Redirect to CloudFront and S3
    redirect_to "https://s3.amazonaws.com/2014-firefly/sitemaps/sitemap1.xml.gz"
  end

end