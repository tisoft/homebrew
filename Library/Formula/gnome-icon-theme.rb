require 'formula'

class GnomeIconTheme <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/gnome-icon-theme/2.28/gnome-icon-theme-2.28.0.tar.bz2'
  homepage ''
  md5 '1b6a782e3f733a5dbb8e62e87a7bdc61'

  depends_on 'gettext'
  depends_on 'icon-naming-utils'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
  	ENV["PKG_CONFIG_PATH"]="#{Formula.factory('icon-naming-utils').share}/pkgconfig"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
