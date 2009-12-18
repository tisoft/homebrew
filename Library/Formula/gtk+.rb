require 'formula'

class Gtkx <Formula
  url 'http://ftp.gnome.org/pub/gnome/sources/gtk+/2.18/gtk+-2.18.0.tar.bz2'
  homepage 'http://www.gtk.org/'
  sha256 '05fce9327dbe78a74ad4cd45383d541f96f19d40d3c03076cdf6908ad28ad241'

  depends_on 'glib'
  depends_on 'atk'
  depends_on 'pango'
  depends_on 'gettext'
  depends_on 'cairo'
  #depends_on 'libtiff'
  #depends_on 'jpeg'

  def install
    ENV.x11

    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--with-gdktarget=quartz",
                          "--enable-xinerama",
                          "--disable-gtk-doc",
                          "--without-libtiff",
                          "--without-libjpeg"

    #system 'make'
    system "make install"
  end
end
