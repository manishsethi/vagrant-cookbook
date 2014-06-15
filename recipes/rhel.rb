node['vagrant']['url'] = node['vagrant']['base_url'] + "/vagrant_#{node['vagrant']['version']}_x86_64.rpm"

remote_file "#{Chef::Config[:file_cache_path]}/vagrant.rpm" do
  source node['vagrant']['url']
  checksum node['vagrant']['checksum']
  notifies :install, "rpm_package[vagrant]", :immediately
end

rpm_package "vagrant" do
  source "#{Chef::Config[:file_cache_path]}/vagrant.rpm"
end
