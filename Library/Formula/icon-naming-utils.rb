require 'formula'

class IconNamingUtils <Formula
  url 'http://tango.freedesktop.org/releases/icon-naming-utils-0.8.90.tar.gz'
  homepage ''
  md5 '2c5c7a418e5eb3268f65e21993277fba'

# depends_on 'cmake'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
