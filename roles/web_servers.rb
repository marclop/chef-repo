name "web_servers"
description "This role contains nodes acting as web servers"
run_list  "recipe[base]",
          "recipe[madacs_nginx]"