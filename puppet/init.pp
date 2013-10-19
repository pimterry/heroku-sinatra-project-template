include "apt"
/*
 This file defines the deployment instructions when vagrant up-ing a local dev environment.
 This should create a close approximation of the Heroku deployment environment used in actual
 deployment. In future, this could be used to drop Heroku entirely to move onto IaaS
 directly, keeping the whole standard environment too, but for now this is easier
*/

# Set up Heroku-esq env vars
$envVarsScript = "/etc/profile.d/heroku_env_vars.sh"
file { $envVarsScript:
  ensure => present,
  owner => 'root',
  group => 'root',
  mode => '0744',
  source => "file:///vagrant/puppet/heroku_env_vars.sh"
}


package { "libffi-dev": }
->
exec { 'bundle install --without development':
  path => ["/usr/bin", "/opt/ruby/bin"],
  cwd => "/vagrant"
}

exec { 'test 1 -eq "`psql -l | grep -c unnamedapp`" || createdb unnamedapp':
  path => ['/bin/', '/usr/bin'],
  user => 'postgres'
}