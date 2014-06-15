node['vagrant']['url'] = node['vagrant']['base_url'] + "/vagrant_#{node['vagrant']['version']}.msi"

windows_package "Vagrant #{node['vagrant']['msi_version']}" do
  source node['vagrant']['url']
  checksum node['vagrant']['checksum']
  action :install
end
