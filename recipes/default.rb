#
# Cookbook Name:: pw_dnsmasq
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'pw_testhelper'

package 'dnsmasq'

service 'dnsmasq' do
  supports :status => true
  action [ :enable ]
end

template '/etc/dnsmasq.d/pingworks' do
  source 'dnsmasq-pingworks.erb'
  owner 'root'
  group 'root'
  mode 00644
  notifies :restart, 'service[dnsmasq]', :delayed
end
