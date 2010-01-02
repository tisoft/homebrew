require 'formula'

class Orbit2 <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/ORBit2/2.14/ORBit2-2.14.17.tar.bz2'
  homepage ''
  md5 '10bfb957fa4a8935a0b4afaee7d71df7'

 depends_on 'gettext'
 depends_on 'libidl'

  def install
  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
