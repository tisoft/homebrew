require 'formula'

class GnomeVfs <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/gnome-vfs/2.24/gnome-vfs-2.24.2.tar.gz'
  homepage ''
  md5 '40846d1ac26d625060912419b200d9e6'

  depends_on 'gnome-mime-data'
  depends_on 'intltool'
  depends_on 'pkg-config'
  depends_on 'glib'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext"
  	ENV["PKG_CONFIG_PATH"]="#{Formula.factory('gnome-mime-data').share}/pkgconfig"
  	ENV["LIBS"]="-lresolv" 
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
