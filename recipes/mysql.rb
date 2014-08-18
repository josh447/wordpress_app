#
# Cookbook Name:: wordpress_app
# Recipe:: mysql
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

mysql_connection_info = {
  :host => "localhost",
  :username => 'root',
  :password => node['mysql']['server_root_password']
}

mysql_database 'wordpress' do
  connection mysql_connection_info
  action [:drop, :create]
end

mysql_database_user 'DB_user' do
  connection mysql_connection_info
  password 'Password'             #Create a strong password here.
  database_name 'wordpress'
  host '%'
  privileges [:all]
  action :grant
end

remote_file '/root/wordpress.sql' do
  source 'https://import_link_to_your_DB' #Delete this link and put the link to your mysql db.
  action :create_if_missing
  notifies :run, 'execute[import]', :immediately
end

execute "import" do
  command "mysql wordpress < /root/wordpress.sql"
  action :nothing
end