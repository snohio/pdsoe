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
