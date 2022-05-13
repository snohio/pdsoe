#
# Cookbook:: pdsoe
# Recipe:: default
#
# Copyright:: 2022, Mike Butler, All Rights Reserved.

include_profile 'pdsoe::pdsoe'

include_recipe 'chocolatey::default'

chocolatey_package 'openjdk' do
  action :install
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

windows_package 'OpenEdge 12.2 (64-bit)' do
  action :install
  source 'C:\temp\pdsoe\setup.exe'
  installer_type :installshield
  options '-psc_s -psc_fl=c:\Windows\oesp_response.ini -psc_f2=c:\temp\oesetup.log'
  timeout 1800
end

# powershell command to execute
# .\setup.exe -psc_s -psc_fl=c:\temp\pdsoe\response.ini -psc_f2=c:\temp\pdsoe\setup.log
