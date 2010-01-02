require 'formula'

class Libart <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libart_lgpl/2.3/libart_lgpl-2.3.20.tar.bz2'
  homepage ''
  md5 'd0ce67f2ebcef1e51a83136c69242a73'

# depends_on 'cmake'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
