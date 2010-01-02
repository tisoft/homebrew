require 'formula'

class Libgtkhtml38 <Formula
  url 'http://ftp.acc.umu.se/pub/GNOME/sources/gtkhtml/3.12/gtkhtml-3.12.3.tar.bz2'
  homepage ''
  md5 'b580590014988b02e51b66be65319570'

  depends_on 'gettext'
  depends_on 'gtk+'
  depends_on 'gconf'
  depends_on 'enchant'
  depends_on 'iso-codes'
  depends_on 'gnome-icon-theme'
  depends_on 'libgnomeprintui'
  depends_on 'libgnomeui'
  depends_on 'libglade'

  def patches
    # Fix compile error
    DATA
  end


  def install
    ENV.gcc_4_2

  	ENV["CPPFLAGS"]="-I#{Formula.factory('gettext').include}" 
  	ENV["LDFLAGS"]="-L#{Formula.factory('gettext').lib}" 
  	ENV["MSGFMT"]="#{Formula.factory('gettext').bin}/msgfmt" 
  	ENV["MSGMERGE"]="#{Formula.factory('gettext').bin}/msgmerge" 
  	ENV["XGETTEXT"]="#{Formula.factory('gettext').bin}/xgettext" 
  	ENV["PKG_CONFIG_PATH"]="#{Formula.factory('iso-codes').share}/pkgconfig:#{Formula.factory('gnome-icon-theme').share}/pkgconfig"
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
#   system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end

__END__
diff -Nur gtkhtml3.8-3.13.5/src/htmlengine-edit-clueflowstyle.c gtkhtml3.8-3.13.5.new/src/htmlengine-edit-clueflowstyle.c
--- gtkhtml3.8-3.13.5/src/htmlengine-edit-clueflowstyle.c	2007-01-03 16:28:53.000000000 +0100
+++ gtkhtml3.8-3.13.5.new/src/htmlengine-edit-clueflowstyle.c	2008-02-13 20:48:00.000000000 +0100
@@ -175,7 +175,7 @@
 	while (p != NULL) {
 		if (HTML_OBJECT_TYPE (obj->parent) != HTML_TYPE_CLUEFLOW) {
 			g_warning ("(%s:%s)  Eeeek!  Unknown parent type `%s'.",
-				   __FILE__, G_GNUC_FUNCTION,
+				   __FILE__, G_STRFUNC,
 				   html_type_name (HTML_OBJECT_TYPE (obj->parent)));
 			break;
 		}
@@ -209,7 +209,7 @@
 				/* This should not happen.  */
 				g_warning ("(%s:%s)  There were not enough paragraphs for "
 					   "setting the paragraph style.",
-					   __FILE__, G_GNUC_FUNCTION);
+					   __FILE__, G_STRFUNC);
 				break;
 			}
 		} while (obj != NULL && HTML_CLUEFLOW (obj->parent) == clueflow);
@@ -217,7 +217,7 @@
 
 	if (prop_list == NULL) {
 		/* This should not happen.  */
-		g_warning ("%s:%s Eeek!  Nothing done?", __FILE__, G_GNUC_FUNCTION);
+		g_warning ("%s:%s Eeek!  Nothing done?", __FILE__, G_STRFUNC);
 		return;
 	}
 
@@ -280,7 +280,7 @@
 	while (p != NULL) {
 		if (HTML_OBJECT_TYPE (p->parent) != HTML_TYPE_CLUEFLOW) {
 			g_warning ("(%s:%s)  Eeeek!  Unknown parent type `%s'.",
-				   __FILE__, G_GNUC_FUNCTION,
+				   __FILE__, G_STRFUNC,
 				   html_type_name (HTML_OBJECT_TYPE (p->parent)));
 			break;
 		}

diff -Nur -x '*.orig' -x '*~' gtkhtml3.8-3.12.3/a11y/Makefile.am gtkhtml3.8-3.12.3.new/a11y/Makefile.am
--- gtkhtml3.8-3.12.3/a11y/Makefile.am	2007-01-29 09:51:00.000000000 +0000
+++ gtkhtml3.8-3.12.3.new/a11y/Makefile.am	2009-05-23 20:40:23.000000000 +0000
@@ -2,7 +2,7 @@
 
 INCLUDES = -I$(top_srcdir)/src $(GTKHTML_CFLAGS) $(I18N_LIB_CFLAGS)
 
-AM_CFLAGS = $(GAIL_CFLAGS) -DGTK_DISABLE_DEPRECATED=1 -DGDK_DISABLE_DEPRECATED=1 -DG_DISABLE_DEPRECATED=1 -DGNOME_DISABLE_DEPRECATED=1
+AM_CFLAGS = $(GAIL_CFLAGS) -DGDK_DISABLE_DEPRECATED=1 -DG_DISABLE_DEPRECATED=1 -DGNOME_DISABLE_DEPRECATED=1
 
 noinst_LTLIBRARIES = libgtkhtml-a11y.la
 
diff -Nur -x '*.orig' -x '*~' gtkhtml3.8-3.12.3/a11y/Makefile.in gtkhtml3.8-3.12.3.new/a11y/Makefile.in
--- gtkhtml3.8-3.12.3/a11y/Makefile.in	2007-01-29 15:12:48.000000000 +0000
+++ gtkhtml3.8-3.12.3.new/a11y/Makefile.in	2009-05-23 20:40:40.000000000 +0000
@@ -251,7 +251,7 @@
 target_alias = @target_alias@
 END = 
 INCLUDES = -I$(top_srcdir)/src $(GTKHTML_CFLAGS) $(I18N_LIB_CFLAGS)
-AM_CFLAGS = $(GAIL_CFLAGS) -DGTK_DISABLE_DEPRECATED=1 -DGDK_DISABLE_DEPRECATED=1 -DG_DISABLE_DEPRECATED=1 -DGNOME_DISABLE_DEPRECATED=1
+AM_CFLAGS = $(GAIL_CFLAGS) -DGDK_DISABLE_DEPRECATED=1 -DG_DISABLE_DEPRECATED=1 -DGNOME_DISABLE_DEPRECATED=1
 noinst_LTLIBRARIES = libgtkhtml-a11y.la
