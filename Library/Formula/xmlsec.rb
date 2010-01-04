require 'formula'

class Xmlsec <Formula
  url 'http://www.aleksey.com/xmlsec/download/xmlsec1-1.2.12.tar.gz'
  homepage 'http://www.aleksey.com/xmlsec/'
  md5 '195d042623bcc2e1668ab8370de6dc2a'

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
