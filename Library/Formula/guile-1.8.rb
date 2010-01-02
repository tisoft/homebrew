require 'formula'

class Guile18 <Formula
  @url='ftp://ftp.gnu.org/gnu/guile/guile-1.8.7.tar.gz'
  @homepage='http://www.gnu.org/software/guile/'
  @sha1='24cd2f06439c76d41d982a7384fe8a0fe5313b54'

  depends_on 'libunistring'
  depends_on 'bdw-gc'
  depends_on 'gmp'
  
  # GNU Readline is required
  # libedit won't work.
  depends_on 'readline'

  def install
    ENV.gcc_4_2

    system "./configure",
        "--prefix=#{prefix}", 
        "--disable-debug", 
        "--disable-dependency-tracking",
        # Specifically look for readline here
        # At least, we don't want the fake readline in
        # /usr/lib to trump us, since it doesn't export
        # all the same symbols
        # --adamv
        "--with-libreadline-prefix=#{Formula.factory('readline').prefix}"
    system "make install"
  end
end