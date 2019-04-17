class system::install inherits system {

  if($system::manage_package)
  {
    package { $system::params::package_name:
      ensure => $system::package_ensure,
    }
  }

}
