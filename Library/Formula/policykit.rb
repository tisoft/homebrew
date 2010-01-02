require 'formula'

class Policykit <Formula
  url 'http://hal.freedesktop.org/releases/PolicyKit-0.9.tar.gz'
  homepage ''
  md5 '802fd13ae41f73d79359e5ecb0a98716'

# depends_on 'cmake'

  def install
    ENV["LDFLAGS"]="-L/usr/lib"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking", "--with-authfw=pam", "--with-pam-prefix=/etc/pam.d", "--with-pam-module-dir=/usr/lib/pam", "--disable-selinux", "--enable-man-pages", "--disable-gtk-doc"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
