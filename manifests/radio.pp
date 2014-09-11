# == Class: graylog2::radio
#
# === Authors
#
# Renan Silva <renanvice@gmail.com>
#
# === Copyright
#
# Copyright 2014 synyx GmbH & Co. KG
#
class graylog2::radio (
  $package_version           = $graylog2::radio::params::package_version,
  $service_ensure            = $graylog2::radio::params::service_ensure,
  $service_enable            = $graylog2::radio::params::service_enable,
  $config_file               = $graylog2::radio::params::config_file,
  $daemon_username           = $graylog2::radio::params::daemon_username,

  $node_id_file              = $graylog2::radio::params::node_id_file,
  $transport_type            = $graylog2::radio::params::transport_type,
  $graylog2_server_uris      = $graylog2::radio::params::graylog2_server_uris,
  $rest_listen_uri           = $graylog2::radio::params::rest_listen_uri,
  $rest_transport_uri        = $graylog2::radio::params::rest_transport_uri,
  $amqp_broker_hostname      = $graylog2::radio::params::amqp_broker_hostname,
  $amqp_broker_port          = $graylog2::radio::params::amqp_broker_port,
  $amqp_broker_vhost         = $graylog2::radio::params::amqp_broker_vhost,
  $amqp_broker_username      = $graylog2::radio::params::amqp_broker_username,
  $amqp_broker_password      = $graylog2::radio::params::amqp_broker_password,
  $kafka_brokers             = $graylog2::radio::params::kafka_brokers,
  $kafka_producer_type       = $graylog2::radio::params::kafka_producer_type,
  $kafka_batch_size          = $graylog2::radio::params::kafka_batch_size,
  $kafka_batch_max_wait_ms   = $graylog2::radio::params::kafka_batch_max_wait_ms,
  $kafka_required_acks       = $graylog2::radio::params::kafka_required_acks,
  $processbuffer_processors  = $graylog2::radio::params::processbuffer_processors,
  $processor_wait_strategy   = $graylog2::radio::params::processor_wait_strategy,
  $ring_size                 = $graylog2::radio::params::ring_size,
  $input_cache_max_size      = $graylog2::radio::params::input_cache_max_size,
  $java_opts                 = $graylog2::radio::params::java_opts,
  $extra_args                = $graylog2::radio::params::extra_args,
  $template_file             = $graylog2::radio::params::template_file,
  $template_config_content   = $graylog2::radio::params::template_config_content,


) inherits graylog2::radio::params {

  anchor {'graylog2::radio::start': }->
  class {'graylog2::radio::package':
    package => $graylog2::radio::params::package_name,
    version => $package_version,
  } ->
  class {'graylog2::radio::configure':
    config_file              => $config_file,
    daemon_username          => $daemon_username,

    node_id_file             => $node_id_file,
    transport_type           => $transport_type,
    graylog2_server_uris     => $graylog2_server_uris,
    rest_listen_uri          => $rest_listen_uri,
    rest_transport_uri       => $rest_transport_uri,
    amqp_broker_hostname     => $amqp_broker_hostname,
    amqp_broker_port         => $amqp_broker_port,
    amqp_broker_vhost        => $amqp_broker_vhost,
    amqp_broker_username     => $amqp_broker_username,
    amqp_broker_password     => $amqp_broker_password,
    kafka_brokers            => $kafka_brokers,
    kafka_producer_type      => $kafka_producer_type,
    kafka_batch_size         => $kafka_batch_size,
    kafka_batch_max_wait_ms  => $kafka_batch_max_wait_ms,
    kafka_required_acks      => $kafka_required_acks,
    processbuffer_processors => $processbuffer_processors,
    processor_wait_strategy  => $processor_wait_strategy,
    ring_size                => $ring_size,
    input_cache_max_size     => $input_cache_max_size,
    java_opts                => $java_opts,
    extra_args               => $extra_args,
    template_file            => $template_file,
    template_config_file     => $template_config_file,
  }~>
  class {'graylog2::radio::service':
    service_name   => $graylog2::radio::params::service_name,
    service_ensure => $service_ensure,
    service_enable => $service_enable,
  } ->
  anchor {'graylog2::server::end': }

}
