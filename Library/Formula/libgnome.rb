require 'formula'

class Libgnome <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libgnome/2.28/libgnome-2.28.0.tar.bz2'
  homepage ''
  md5 '5c7efe21dc28c137aa766a77a84c0c29'

  depends_on 'gettext'
  depends_on 'gnome-vfs'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--disable-esd"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
