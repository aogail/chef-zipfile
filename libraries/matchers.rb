# These are some custom chefspec matchers. Users of this cookbook should
# use these matchers to unit test their cookbooks.

if defined?(ChefSpec)
  def extract_zipfile(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zipfile, :extract, resource_name)
  end
end
