name "docker-policy-chefspec"

default_source :supermarket

run_list "apt::default", "docker-policy-chefspec::default"

cookbook "docker-policy-chefspec", path: "."
cookbook "docker", "2.5.6"
