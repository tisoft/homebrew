require 'formula'

class Libidl <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libIDL/0.8/libIDL-0.8.13.tar.gz'
  homepage ''
  md5 'babf078cfae9e325ab555c54532630cd'

  depends_on 'glib'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
