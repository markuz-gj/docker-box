
file { '/etc/motd':
    content => "- OS: Ubuntu 14.04 \"trusty\" server-amd64
- NodeJS: stable (0.10.x) and latest (0.11.x)
- Packer: stable (0.6.0)
- Docker: stable (1.0.0)
\n"
}

class loadEnv {
  # Exec { path => ['/usr/local/bin','/usr/local/sbin','/usr/bin/','/usr/sbin','/bin','/sbin'], }
}

class {loadEnv: }



# exec { "deps.sh":
#   command => "sh deps.sh",
#   owner => "root",
#   group => "root",
#   logoutput => true,
#   require =>Exec["update.sh"],
# }

# Make all the magic happen by instantiating the nodejs class
# class { nodejs: }
