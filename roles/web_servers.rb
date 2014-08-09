name "web_servers"
description "This role contains nodes acting as web servers"
run_list  "recipe[madacs_nginx]"