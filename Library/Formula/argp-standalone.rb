require 'formula'

class ArgpStandalone <Formula
  url 'http://www.lysator.liu.se/~nisse/misc/argp-standalone-1.3.tar.gz'
  homepage ''
  md5 '720704bac078d067111b32444e24ba69'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
    system "install", "-d", "#{prefix}/lib"
    system "install", "libargp.a", "#{prefix}/lib"
	system "install", "-d", "#{prefix}/include"
	system "install", "argp.h", "#{prefix}/include"
  end
end
