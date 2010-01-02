require 'formula'

class Libglade <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libglade/2.6/libglade-2.6.4.tar.bz2'
  homepage ''
  md5 'd1776b40f4e166b5e9c107f1c8fe4139'

# depends_on 'cmake'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
