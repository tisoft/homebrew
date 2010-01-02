require 'formula'

class IsoCodes <Formula
  url 'http://ftp.de.debian.org/debian/pool/main/i/iso-codes/iso-codes_3.12.1.orig.tar.bz2'
  homepage ''
  md5 'a7b726594ca9d4b3b71481db7b7630e2'

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
