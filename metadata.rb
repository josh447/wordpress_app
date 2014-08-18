# Encoding: utf-8
name             'wordpress_app'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'none'
license          ''
description      'Installs/Configures wordpress_app'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
depends 'apt'
depends 'rackops_rolebook'
depends 'phpstack'
