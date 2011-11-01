require 'formula'

class Ext2fuse < Formula
  url 'http://sourceforge.net/projects/ext2fuse/files/ext2fuse/0.8.1/ext2fuse-src-0.8.1.tar.gz'
  homepage 'http://sourceforge.net/projects/ext2fuse'
  md5 '8926c6eeb9ea17846466ca4bd7143489'

  depends_on 'fuse4x'
  depends_on 'e2fsprogs'

  def install
    ENV['LIBS']="-lfuse4x"
    ENV['CPPFLAGS']="-DHAVE_TYPE_SSIZE_T=1"

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    output = `ext2fuse --version`
    if (!output.include? version)
      throw
    end
  end
end
