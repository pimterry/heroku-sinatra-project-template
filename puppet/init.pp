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

exec { 'bundle install':
  path => ["/usr/bin", "/opt/ruby/bin"],
  cwd => "/vagrant"
}

apt::ppa { "ppa:webupd8team/java":
  options => "",
}

apt::key { "neo4j-key":
  key => '2DC499C3',
  key_source => 'http://debian.neo4j.org/neotechnology.gpg.key'
}
->
apt::source { "neo4j":
  location => 'http://debian.neo4j.org/repo',
  release => '',
  repos => 'stable/'
}

exec { "apt-get update":
  command => '/usr/bin/apt-get update',
  require => [Apt::Ppa["ppa:webupd8team/java"], Apt::Source["neo4j"]]
}
->
exec { "disable java 7 license acceptance":
  command => "echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections",
  cwd => "/home/vagrant",
  path => "/usr/bin/:/bin/"
}
->
package { "oracle-java7-installer": }
->
package { "neo4j": }
->
file { "/etc/neo4j/neo4j-server.properties":
    source => "file:///vagrant/puppet/neo4j-server.properties"
}
~>
service { "neo4j-service":
}