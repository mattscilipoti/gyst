source "http://rubygems.org"

# Specify your gem's dependencies in gys.gemspec
gemspec

group :test do
  gem 'cucumber_spinner'
  gem 'factory_girl' # not in gemspec since use of factory_girl patch is optional
end

group :blog do
  gem 'jekyll', '0.10.0' # version for gh_pages
  gem 'liquid', '2.0.0'  # version for gh_pages (http://support.github.com/discussions/site/3216-github-pages-liquid-template-tags-not-being-parsed)
  gem 'rdiscount' # I haven't found the gh_pages specific version yet.
end
