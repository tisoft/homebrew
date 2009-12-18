require 'formula'

class Cairo <Formula
  url 'http://www.cairographics.org/releases/cairo-1.8.8.tar.gz'
  homepage 'http://www.cairographics.org/'
  sha1 'e4b8b219427d1ca3dc95f5f44914dce1ae0c3766'

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--enable-xlib=no",
                          "--enable-xlib-xrender=no",
                          "--enable-quartz=yes",
                          "--enable-quartz-font=yes",
                          "--enable-quartz-image=yes"

    system "make install"
  end
end
