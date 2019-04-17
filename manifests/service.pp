class system::service inherits system {

  #
  validate_bool($system::manage_docker_service)
  validate_bool($system::manage_service)
  validate_bool($system::service_enable)

  validate_re($system::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${system::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $system::manage_docker_service)
  {
    if($system::manage_service)
    {
      service { $system::params::service_name:
        ensure => $system::service_ensure,
        enable => $system::service_enable,
      }
    }
  }
}
