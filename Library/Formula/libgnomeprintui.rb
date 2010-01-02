require 'formula'

class Libgnomeprintui <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libgnomeprintui/2.18/libgnomeprintui-2.18.4.tar.bz2'
  homepage ''
  md5 'e76d763f6279b900a63e5fb2909f8810'

  depends_on 'gettext'
  depends_on 'libgnomeui'
  depends_on 'libgnomeprint'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
   	ENV["PKG_CONFIG_PATH"]="#{Formula.factory('gnome-icon-theme').share}/pkgconfig"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
