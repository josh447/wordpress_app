# Encoding: utf-8
#
# Cookbook Name:: wordpress_app
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
include_recipe 'rackops_rolebook::rack_user'
include_recipe 'phpstack::apache'
include_recipe 'phpstack::application_php'
include_recipe 'phpstack::mysql_base'
include_recipe 'wordpress_app::mysql'

template "/var/www/wordpress_site/current/wp-config.php" do 
	source "wp-config.php.erb"
	mode 0644
	owner "root"
	group "root"
end