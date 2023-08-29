# myflutter3

A new Flutter project.

## Getting Started
### 构建和发布为 Android 应用
- 生成图标   flutter pub run flutter_launcher_icons
- 生成启动页 dart run flutter_native_splash:create
  在线生成图标 https://www.appicon.co/  
  https://www.bilibili.com/video/BV1fG411N7Y5/?spm_id_from=333.337.search-card.all.click&vd_source=7f54c15ff3b9f3a869c2cbc92b0c6d0a 
- 打包apk 
    https://www.bilibili.com/video/BV11K4y1S7Sg/?spm_id_from=333.337.search-card.all.click&vd_source=7f54c15ff3b9f3a869c2cbc92b0c6d0a
    https://flutter.cn/docs/deployment/android#reviewing-the-app-manifest
    keytool -genkey -v -keystore D:\keys\upload-keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key  
    flutter build apk
- 使用keytool 获取Android签名证书的sha1值
  cd C:\Users\Administrator\.android  
  keytool -list -v -keystore debug.keystore (密钥口令是android）  