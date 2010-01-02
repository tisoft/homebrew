require 'formula'

class GnomeMimeData <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/gnome-mime-data/2.18/gnome-mime-data-2.18.0.tar.bz2'
  homepage ''
  md5 '541858188f80090d12a33b5a7c34d42c'

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
