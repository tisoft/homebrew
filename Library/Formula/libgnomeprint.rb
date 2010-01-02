require 'formula'

class Libgnomeprint <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/libgnomeprint/2.18/libgnomeprint-2.18.6.tar.bz2'
  homepage ''
  md5 'a5aa248058a07de4b3cf444673cfc683'

  depends_on 'gettext'
  depends_on 'libgnomecups'

  def patches
    host = "http://trac.macports.org"
    base = "browser/trunk/dports/gnome/libgnomeprint/files"
    { :p0 => "#{host}/#{base}/patch-configure.diff?rev=40425&format=txt" }
  end


  def install
    ENV.gcc_4_2

  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}"
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
