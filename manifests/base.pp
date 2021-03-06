# An example Puppet manifest to provision the message of the day:

 group { "puppet":
   ensure => "present",
 }

 File { owner => 0, group => 0, mode => 0644 }

 file { '/etc/motd':
   content => "Welcome to your Vagrant-built virtual machine!
               Managed by Puppet.\n"
 }

package { "screen":
    ensure => "installed"
}
