require 'formula'

class Libgnomecups <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libgnomecups/0.2/libgnomecups-0.2.3.tar.bz2'
  homepage ''
  md5 'dc4920c15c9f886f73ea74fbff0ae48b'

  depends_on 'gettext'

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
