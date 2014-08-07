# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "marclop"
client_key               "#{current_dir}/marclop.pem"
validation_client_name   "madacs-home-validator"
validation_key           "#{current_dir}/madacs-home-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/madacs-home"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright       "MADACS"
cookbook_license         "apachev2"
cookbook_email           "marc5.12@outlook.com"