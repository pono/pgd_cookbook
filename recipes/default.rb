include_recipe "pgd::packages"
include_recipe "yum"
include_recipe "python"
include_recipe "git"

# Check directory for cloning
directory node['pgd']['path'] do
  owner node['pgd']['owner']
  group node['pgd']['group']
  recursive true
  action :create
end

# clone the repo 
git node['pgd']['path'] do
  repository node['pgd']['repository']
  revision node['pgd']['revision']
  user node['pgd']['owner']
  group node['pgd']['group']
end


directory "/tmp/folder" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

