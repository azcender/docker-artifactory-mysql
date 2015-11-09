node default {

  file { '/etc/mysql/conf.d/config-file.cnf':
    ensure => file,
  }

  # Fix database configuration to reflect Artifactory needs
  file_line { '[mysqld]':
    path    => '/etc/mysql/conf.d/config-file.cnf',
    line    => '[mysqld]',
    require => File['/etc/mysql/conf.d/config-file.cnf'],
  }

  file_line { 'max_allowed_packet':
    path    => '/etc/mysql/conf.d/config-file.cnf',
    after   => '\[mysqld\]',
    line    => 'max_allowed_packet=8M',
    require => File_line['[mysqld]'],
  }

  file_line { 'innodb_file_per_table':
    path    => '/etc/mysql/conf.d/config-file.cnf',
    after   => '\[mysqld\]',
    line    => 'innodb_file_per_table',
    require => File_line['[mysqld]'],
  }

  file_line { 'innodb_buffer_pool_size':
    path    => '/etc/mysql/conf.d/config-file.cnf',
    after   => '\[mysqld\]',
    line    => 'innodb_buffer_pool_size=1536M',
    require => File_line['[mysqld]'],
  }

  file_line { 'tmp_table_size':
    path    => '/etc/mysql/conf.d/config-file.cnf',
    after   => '\[mysqld\]',
    line    => 'tmp_table_size=512M',
    require => File_line['[mysqld]'],
  }

  file_line { 'max_heap_table_size':
    path    => '/etc/mysql/conf.d/config-file.cnf',
    after   => '\[mysqld\]',
    line    => 'max_heap_table_size=512M',
    require => File_line['[mysqld]'],
  }

  file_line { 'innodb_log_file_size':
    path    => '/etc/mysql/conf.d/config-file.cnf',
    after   => '\[mysqld\]',
    line    => 'innodb_log_file_size=256M',
    require => File_line['[mysqld]'],
  }

  file_line { 'innodb_log_buffer_size':
    path    => '/etc/mysql/conf.d/config-file.cnf',
    after   => '\[mysqld\]',
    line    => 'innodb_log_buffer_size=4M',
    require => File_line['[mysqld]'],
  }
}
