require 'formula'

class Pango <Formula
  url 'http://ftp.gnome.org/pub/GNOME/sources/pango/1.26/pango-1.26.1.tar.bz2'
  homepage 'http://www.pango.org/'
  sha256 'e0254e979bf0fac305de596997cabda83e26c713b666bc582aa9e4b70cb0920d'

  depends_on 'glib'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--without-x"
    system "make install"
  end
end
