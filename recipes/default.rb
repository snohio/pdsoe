#
# Cookbook:: pdsoe
# Recipe:: default
#
# Copyright:: 2022, Mike Butler, All Rights Reserved.

include_profile 'pdsoe::pdsoe'

if ::File.exist?('C:\Progress\OpenEdge\version')
  version = ::File.read('C:\Progress\OpenEdge\version').split[2]
  node.default['openedge']['version'] = version
else
  include_recipe 'pdsoe::install'
end

if tagged?('oe_upgrade')
  include_recipe 'pdsoe::upgrade'
end
