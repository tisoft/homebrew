require 'formula'

class DBusGlib <Formula
  url 'http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.80.tar.gz'
  homepage ''
  md5 '86ea60ba2118a1b9deafe8257f6a6a1a'

 depends_on 'd-bus'
 depends_on 'glib'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
