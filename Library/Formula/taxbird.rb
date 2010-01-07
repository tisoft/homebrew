require 'formula'

class Taxbird <Formula
  url 'http://www.taxbird.de/download/taxbird/0.14/taxbird-0.14.tar.gz'
  homepage ''
  md5 'dc499c9f11d42b28dd6bf57d94824412'

  depends_on 'libgeier'
  depends_on 'guile-1.8'
  depends_on 'libgnomeui'
  depends_on 'libgtkhtml3.8'
  depends_on 'libgtkhtml3.14'

  def skip_clean? path
	true
  end

  def install
    ENV.gcc_4_2
    ENV.gettext

    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
