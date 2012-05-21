# Class: CPanel
#
# This module manages CPanel
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class CPanel {

    # execute this first
    file { 'config':
        path    => '/etc/selinux/config',
        ensure  => file,
        require => File['cpanel'],
        content => template("CPanel/selinux.config.erb"),
    }

    # then check if cpanel is installed
    file { 'cpanel':
        path    => '/etc/init.d/cpanel',
        ensure  => file,
    }

    # if not, execute the following
    {
        # remove requisite packages
        yum_groupremove { yumgroup { "mail-server": } }
        yum_groupremove { yumgroup { "ftp-server": } }
        yum_groupremove { yumgroup { "kde-desktop": } }
        yum_groupremove { yumgroup { "legacy-x": } }
        yum_groupremove { yumgroup { "web-server": } }
        yum_groupremove { yumgroup { "web-servlet": } }
        yum_groupremove { yumgroup { "system-management-wbem": } }
        yum_groupremove { yumgroup { "x11": } }
    
        # disable firewall
        exec => "chkconfig iptables off && service iptables stop",

        # install cpanel
        exec => "wget -O- http://httpupdate.cpanel.net/latest | sh -",

    }



}
