require 'formula'

class Libgnomeui <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libgnomeui/2.24/libgnomeui-2.24.2.tar.gz'
  homepage ''
  md5 '7db9e6b10d52bd23147716bcbd988e16'

 depends_on 'popt'
 depends_on 'libbonoboui'
 depends_on 'gnome-keyring'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
    system "./configure", "--prefix=#{prefix}", 
                          "--disable-debug", 
                          "--disable-dependency-tracking",
                          "--without-x"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
