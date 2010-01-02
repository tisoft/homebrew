require 'formula'

class Libgtkhtml314 <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/gtkhtml/3.29/gtkhtml-3.29.4.tar.bz2'
  homepage ''
  md5 'f60a5b10a32e2c7ab2141bfe7c1700c7'

  depends_on 'gettext'
  depends_on 'gtk+'
  depends_on 'gconf'
  depends_on 'enchant'
  depends_on 'iso-codes'
  depends_on 'gnome-icon-theme'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
  	ENV["PKG_CONFIG_PATH"]="#{Formula.factory('iso-codes').share}/pkgconfig:#{Formula.factory('gnome-icon-theme').share}/pkgconfig"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
