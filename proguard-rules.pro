#---------------------------------基本固定区---------------------------------

#---------------------------------基本指令区---------------------------------
-optimizationpasses 5 # 代码混淆的压缩比例，值在0-7之间
-dontusemixedcaseclassnames # 混淆后类名都为小写
-dontskipnonpubliclibraryclasses # 指定不去忽略非公共的库的类
-dontskipnonpubliclibraryclassmembers # 指定不去忽略非公共的库的类的成员
-dontpreverify # 不做预校验的操作
-printmapping proguardMapping.txt # 生成原类名和混淆后的类名的映射文件
-optimizations !code/simplification/cast,!field/*,!class/merging/* # 指定混淆是采用的算法
-keepattributes *Annotation*,InnerClasses # 不混淆Annotation
-keepattributes Signature # 不混淆泛型
-keepattributes SourceFile,LineNumberTable # 抛出异常时保留代码行号

#---------------------------------默认保留区---------------------------------
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.view.View
-keep public class com.android.vending.licensing.ILicensingService
-keep class android.support.** {*;}

-keep public class * extends android.view.View{
    *** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
}
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
-keep class **.R$* {
 *;
}
-keepclassmembers class * {
    void *(**On*Event);
}

#---------------------------------webview---------------------------------
-keepclassmembers class fqcn.of.javascript.interface.for.Webview {
   public *;
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
    public boolean *(android.webkit.WebView, java.lang.String);
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, jav.lang.String);
}

#---------------------------------定制化区域---------------------------------

#---------------------------------实体类---------------------------------
-keep class 实体类所在包.** { *; }

#---------------------------------第三方包---------------------------------
-libraryjars xxx.jar
-dontwarn 实体类所在包.**
-keep class  实体类所在包.** { *;}

#---------------------------------JS互调类---------------------------------
-keep class 实体类所在包.** { *; }
-keepclasseswithmembers class 实体类所在包.父类$子类 { <methods>; }

#---------------------------------反射类---------------------------------
-keep class 实体类所在包.** { *; }
