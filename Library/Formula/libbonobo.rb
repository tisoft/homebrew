require 'formula'

class Libbonobo <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libbonobo/2.24/libbonobo-2.24.2.tar.bz2'
  homepage ''
  md5 '5c7c5ea9c2f78a3c1e9ff2f1e27ad751'

 depends_on 'intltool'
 depends_on 'gettext'
 depends_on 'glib'
 depends_on 'orbit2'
 depends_on 'd-bus'
 depends_on 'd-bus-glib'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
