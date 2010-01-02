require 'formula'

class Libbonoboui <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libbonoboui/2.24/libbonoboui-2.24.2.tar.bz2'
  homepage ''
  md5 '3c206eccc97730c02366a2f698c40ed2'

 depends_on 'libbonobo'
 depends_on 'gconf'
 depends_on 'libgnome'
 depends_on 'libgnomecanvas'

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
