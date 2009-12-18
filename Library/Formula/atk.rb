require 'formula'

class Atk <Formula
  url 'http://ftp.gnome.org/pub/gnome/sources/atk/1.29/atk-1.29.3.tar.bz2'
  homepage 'http://projects.gnome.org/accessibility/'
  sha256 'fc67ed25ea41c797e0974ae26acfeb2d7e7838fe97bd87e617376077d25ef302'

  depends_on 'glib'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
