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

  	ENV["CPPFLAGS"]="-fnested-functions -I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
