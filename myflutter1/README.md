# myfltter1

A new Flutter project.

## Getting Started
中文文档：https://flutter.cn/docs/ui
dart文档：https://dart.cn/language
flutter.cn samples: https://github.com/cfug/flutter.cn/tree/main/examples
flutter.dev samples: https://github.com/flutter/samples/tree/main/provider_shopper

## Dart基础
 flutter_appauth
 flutter_secure_storage: 可用于存储令牌、配置等机密信息,保证安全。
      iOS使用Keychain
      Android使用KeyStore, 使用 AES 加密。AES 密钥使用 RSA 加密，RSA 密钥存储在KeyStore中
      Linux使用libsecret
      Web使用 WebCrypto 进行实验性实现
## 学习步骤
0.组件的使用
  组件目录 https://flutter.cn/docs/reference/widgets
  webview_flutter(android&ios): https://pub-web.flutter-io.cn/packages/webview_flutter/versions/2.0.6/install
  webview_flutter_web(web)
1.导航路由go_router
2.表单交互
3.状态管理
  provider -> https://github.com/rrousselGit/provider/blob/master/resources/translations/zh-CN/README.md
4.序列化 -> https://flutter.cn/docs/data-and-backend/serialization/json
      使用json_annotation以及自动生成模型
      flutter pub add json_annotation
      flutter pub add --dev build_runner
      flutter pub add --dev json_serializable
      flutter packages pub run build_runner build
      flutter pub run build_runner watch 启动监听持续生成代码
5.持久化 -> https://flutter.cn/docs/cookbook/persistence/key-value
      保存用户数据，保存设置选项，主题
      kv: shared_preferences
      sqlite: sqflite 
6.网络&HTTP -> https://flutter.cn/docs/data-and-backend/networking
      http: dio
      websocket: web_socket_channel
7.资源&媒体
      local: assess_path
      remote: Image.network()
设置
  主题 深色&浅色&随系统
  国际化 中文&英文&随系统 https://flutter.cn/docs/accessibility-and-localization/internationalization
  中文字体 https://flutter.cn/docs/cookbook/design/fonts

打包部署
   计算sha1
   keystore
.百度地图(android&ios) -> https://lbsyun.baidu.com/faq/api?title=flutter/loc/guide/solocationMany
  keystore
  sha1
