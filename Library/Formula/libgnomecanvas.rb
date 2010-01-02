require 'formula'

class Libgnomecanvas <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libgnomecanvas/2.26/libgnomecanvas-2.26.0.tar.bz2'
  homepage ''
  md5 '9bbc635e5ae70e63af071af74ba7e72f'

  depends_on 'gettext'
  depends_on 'gtk+'
  depends_on 'libart'
  depends_on 'libglade'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
