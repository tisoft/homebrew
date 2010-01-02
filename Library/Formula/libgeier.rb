require 'formula'

class Libgeier <Formula
  url 'http://www.taxbird.de/download/libgeier/0.10/libgeier-0.10.tar.gz'
  homepage 'http://www.taxbird.de'
  md5 '6d985ce1508b360401d6a35b9f717db5'

 depends_on 'xmlsec'
 depends_on 'argp-standalone'

  def install
  	ENV["LIBS"]="-largp" 
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
