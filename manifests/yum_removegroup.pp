define yumgroup($ensure = "present", $optional = false) {
   case $ensure {
      present,installed: {
         $pkg_types_arg = $optional ? {
            true => "--setopt=group_package_types=optional,default,mandatory",
            default => ""
         }
         exec { "Installing $name yum group":
            command => "yum -y groupremove $pkg_types_arg $name",
            unless => "yum groupinfo -v $name |sed '1,/^ Mandatory/d;/^ Default/,$d'",
            timeout => 600,
         }
      }
   }
}
