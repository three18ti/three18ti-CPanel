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

   yum_groupremove { yumgroup { '"group E-mail server"': } }
   yum_groupremove { yumgroup { '"FTP server"': } }
   yum_groupremove { yumgroup { '"KDE Desktop"': } }
   yum_groupremove { yumgroup { '"Legacy X Window System compatibility"': } }
   yum_groupremove { yumgroup { '"Web Server"': } }
   yum_groupremove { yumgroup { '"Web Servlet Engine"': } }
   yum_groupremove { yumgroup { '"Web-Based Enterprise Management"': } }
   yum_groupremove { yumgroup { '"X Window System"': } }



}
