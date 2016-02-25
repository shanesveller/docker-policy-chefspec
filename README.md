# Summary
When using the following versions, Chef converges work fine but ChefSpec raises an exception originating in CompatResource.

* Chef 12.7.2
* ChefSpec from git (occurs on both `20711f0` and `a1d32fa`)
* ChefDK 0.11.0
* chef-cookbooks/docker cookbook 2.5.6
* compat_resource cookbook/gem 12.7.3
* kitchen-vagrant 0.19.0
* TestKitchen 1.5.0

# Stacktrace

The following stacktrace occurs for me on my local machine:
```
$ chef exec bundle exec rspec

[...]
Randomized with seed 10300
F

Failures:

  1) docker-policy-chefspec::default When all attributes are default, on an unspecified platform converges successfully
     Failure/Error: expect { chef_run }.to_not raise_error

       expected no Exception, got #<RuntimeError: Already loaded ChefCompat from files/lib/compat_resource/gemspec.rb. Cannot load a second time from /Users/shane/.chefdk/gem/ruby/2.1.0/gems/compat_resource-12.7.3/files/lib/compat_resource/gemspec.rb> with backtrace:
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/compat_resource-12.7.3/files/lib/compat_resource/gemspec.rb:2:in `<top (required)>'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/compat_resource-12.7.3/files/lib/compat_resource.rb:4:in `require'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/compat_resource-12.7.3/files/lib/compat_resource.rb:4:in `<top (required)>'
         # /var/folders/jm/_vq2xl_97fvb21y4f7kdppgc0000gn/T/d20160225-72328-1c0o3r5/cookbooks/compat_resource/libraries/autoload.rb:19:in `require'
         # /var/folders/jm/_vq2xl_97fvb21y4f7kdppgc0000gn/T/d20160225-72328-1c0o3r5/cookbooks/compat_resource/libraries/autoload.rb:19:in `<top (required)>'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context/cookbook_compiler.rb:191:in `load'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context/cookbook_compiler.rb:191:in `block in load_libraries_from_cookbook'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context/cookbook_compiler.rb:188:in `each'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context/cookbook_compiler.rb:188:in `load_libraries_from_cookbook'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context/cookbook_compiler.rb:99:in `block in compile_libraries'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context/cookbook_compiler.rb:98:in `each'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context/cookbook_compiler.rb:98:in `compile_libraries'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context/cookbook_compiler.rb:71:in `compile'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/run_context.rb:167:in `load'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/policy_builder/expand_node_object.rb:93:in `setup_run_context'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/gems/chef-12.7.2/lib/chef/client.rb:509:in `setup_run_context'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/bundler/gems/chefspec-20711f04fa95/lib/chefspec/solo_runner.rb:117:in `converge'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/bundler/gems/chefspec-20711f04fa95/lib/chefspec/server_runner.rb:60:in `converge'
         # ./spec/unit/recipes/default_spec.rb:13:in `block (3 levels) in <top (required)>'
         # ./spec/unit/recipes/default_spec.rb:17:in `block (4 levels) in <top (required)>'
         # /Users/shane/.chefdk/gem/ruby/2.1.0/bundler/gems/chefspec-20711f04fa95/lib/chefspec/expect_exception.rb:15:in `matches?'
         # ./spec/unit/recipes/default_spec.rb:17:in `block (3 levels) in <top (required)>'
     # ./spec/unit/recipes/default_spec.rb:17:in `block (3 levels) in <top (required)>'

Finished in 5.3 seconds (files took 0.83345 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/unit/recipes/default_spec.rb:16 # docker-policy-chefspec::default When all attributes are default, on an unspecified platform converges successfully

Randomized with seed 10300
[...]
```
