require 'formula'

class GnomeKeyring <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/gnome-keyring/2.26/gnome-keyring-2.26.3.tar.bz2'
  homepage ''
  md5 'd7639185dce46c26cf2e7d2a75028f78'

  depends_on 'gettext'
  depends_on 'libgcrypt'
  depends_on 'libtasn1'
  depends_on 'gconf'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
    system "./configure", "--prefix=#{prefix}", 
                          "--disable-debug", 
                          "--disable-dependency-tracking",
                          "--disable-schemas-install"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
