# Cookbook:: pdsoe
# Recipe:: install
# Copyright:: 2022, Mike Butler, All Rights Reserved.

if node['chef_packages']['chef']['version'] < '18.4.2'
  include_recipe 'chocolatey::default'

else
  chocolatey_installer 'latest' do
    action :install
  end
end

windows_defender 'Defender Pause Realtime Protection' do
  realtime_protection false
end

chocolatey_package 'openjdk' do
  action :install
  version '18.0.1.1'
end

directory 'C:\temp' do
  rights :full_control, 'Everyone'
  inherits true
  action :create
  recursive true
end

remote_file 'c:\temp\pdsoe.zip' do
  source node['openedge']['studio_install_path']
  action :create
end

archive_file 'c:\temp\pdsoe.zip' do
  destination 'c:\temp\pdsoe'
  action :extract
end

cookbook_file 'C:\Windows\oesp_response.ini' do
  source 'oesp_response.ini'
  action :create
end

log 'Installing Progress Desktop Studio for OpenEdge - Patience is a virtue!' do
  level :info
end

windows_package 'OpenEdge 12.2 (64-bit)' do
  action :install
  source 'C:\temp\pdsoe\setup.exe'
  installer_type :installshield
  options '-psc_s -psc_fl=c:\Windows\oesp_response.ini -psc_f2=c:\temp\oesetup.log'
  timeout 2400
end

windows_defender 'Defender Resume Realtime Protection' do
  realtime_protection true
end
