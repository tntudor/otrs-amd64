include ::apache
include ::mysql::server

Package { 
  ensure     => 'installed' 
}
Service {
  hasrestart => true,
  enable     => true,
  ensure     => true,
}
