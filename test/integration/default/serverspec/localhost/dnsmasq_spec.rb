require_relative '../spec_helper'

describe package('dnsmasq') do
  it { should be_installed }
end

describe command("dig @localhost ctrl.#{$node['pw_dnsmasq']['domain']}") do
  its(:stdout) { should match /ctrl.#{$node['pw_dnsmasq']['domain']}.\s*0\s*IN\s*A\s*#{$node['pw_dnsmasq']['ctrl_ip']}/ }
end

describe command("dig @#{$node['pw_dnsmasq']['gw_ip']} ctrl.#{$node['pw_dnsmasq']['domain']}") do
  its(:stdout) { should match /ctrl.#{$node['pw_dnsmasq']['domain']}.\s*0\s*IN\s*A\s*#{$node['pw_dnsmasq']['ctrl_ip']}/ }
end

describe file('/etc/dnsmasq.d/pingworks') do
  it { should be_file }
  its(:content) { should match /interface=#{$node['pw_dnsmasq']['interface']}/ }
  its(:content) { should match /bind-interfaces/ }
  its(:content) { should match /domain=#{$node['pw_dnsmasq']['domain']}/ }
  its(:content) { should match /listen-address=#{$node['pw_dnsmasq']['gw_ip']}/ }
  its(:content) { should match /dhcp-range=#{$node['pw_dnsmasq']['dhcp_range']}/ }
  its(:content) { should match /dhcp-option=6,#{$node['pw_dnsmasq']['ctrl_ip']}/ }
end
