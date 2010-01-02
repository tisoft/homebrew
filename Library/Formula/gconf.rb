require 'formula'

class Gconf <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/GConf/2.28/GConf-2.28.0.tar.bz2'
  homepage ''
  md5 'ad2aeb9c7d906b274954c51a615caeac'

 depends_on 'glib'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include} -I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include -I/usr/local/include/dbus-1.0 -I#{Formula.factory('d-bus').lib}/dbus-1.0/include/" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext"
  	#--disable-debug causes segfaults. Don't know why.
    system "./configure", "--prefix=#{prefix}", "--enable-debug", "--disable-dependency-tracking", "--disable-defaults-service"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
