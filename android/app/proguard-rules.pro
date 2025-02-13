#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

-keep class com.google.android.play.core.** { *; }
-keep interface com.google.android.play.core.** { *; }
-keep enum com.google.android.play.core.** { *; }

-dontwarn okhttp3.internal.platform.*