use_inline_resources

action :create do
  sites = run_context.resource_collection.select do |x|
    x.resource_name == :resscrape_sub_1
  end.map{|site| {name: site.name} }

  template 'iisconfig' do
    cookbook 'resscrape'
    source 'blah.erb'
    variables sites: sites
  end
end
