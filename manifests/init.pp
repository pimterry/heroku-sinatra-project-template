/*
 This file defines the deployment instructions when vagrant up-ing a local dev environment.
 This should create a close approximation of the Heroku deployment environment used in actual
 deployment. In future, this could be used to drop Heroku entirely to move onto IaaS
 directly, keeping the whole standard environment too, but for now this is easier
*/

file { "/etc/profile.d/heroku_env_vars.sh":
    ensure => present,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => "file:///vagrant/manifests/heroku_env_vars.sh"
}