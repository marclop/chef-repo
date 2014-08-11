#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2014, MADACS
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# TIME
## Enable the NTP service
include_recipe "ntp"

## Load the node.json item from the "misc" data bag, the entire json will be loaded
timezone = data_bag_item('misc', 'node')

## Create a symbolic link pointing to the actual timezone
link "/etc/timezone" do
  to "/usr/share/zoneinfo/#{timezone['timezone']}"
end

# PACKAGES
## Check platform family

if platform_family?("rhel", "fedora")
  include_recipe "yum"
  ### Include the chef client recipe using the init method to daemonize
  include_recipe "chef-client::init_service"
  
elsif platform_family?("debian")
  include_recipe "apt"
  
  ### Include the chef client recipe using the upstarart method to daemonize
  if platform?("ubuntu")
    include_recipe "chef-client::upstart_service"
  else
    include_recipe "chef-client::init_service"
  end
  
else
  ### If none of the platforms is above, throw exception
  Chef::Application.fatal('Platform not supported!! Exiting!!')
end

# LOGROTATE
## Call logrotate with defaults
include_recipe "logrotate::global"

# Beaver agent for logs