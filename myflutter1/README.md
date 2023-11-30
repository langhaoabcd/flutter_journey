# myfltter1

A new Flutter project.

## Getting Started
中文文档：https://flutter.cn/docs/ui
dart文档：https://dart.cn/language
dart hub: https://pub-web.flutter-io.cn/
flutter.cn samples: https://github.com/cfug/flutter.cn/tree/main/examples
flutter.dev samples: https://github.com/flutter/samples/tree/main/provider_shopper
mpflutter https://mpflutter.com/


## 参考项目
【Flutter 集录指南 App】The unity of flutter, The unity of coder.
https://github.com/toly1994328/FlutterUnit


## Dart基础
 flutter_appauth
 flutter_secure_storage: 可用于存储令牌、配置等机密信息,保证安全。
      iOS使用Keychain
      Android使用KeyStore, 使用 AES 加密。AES 密钥使用 RSA 加密，RSA 密钥存储在KeyStore中
      Linux使用libsecret
      Web使用 WebCrypto 进行实验性实现

--GlobalKey获取buildContext
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
navigatorKey.currentContext

## 常用组件
flutter_spinkit loading动画库
OkToast/FlutterToast(各个平台样式会不一致)

## 学习步骤
0.组件的使用
  组件目录 https://flutter.cn/docs/reference/widgets
  webview_flutter(android&ios): https://pub-web.flutter-io.cn/packages/webview_flutter/versions/2.0.6/install
  webview_flutter_web(web)
  
  在Flutter中,EdgeInsets类是用于表示一个widget四周的空白边距(padding)。
  主要包含以下属性:
      EdgeInsets.all(value): 所有方向均为value的边距
      EdgeInsets.only({top, right, bottom, left }): 分别指定四个方向的边距值
      EdgeInsets.symmetric({vertical, horizontal}): 分别指定垂直和水平方向的边距值
  `Container(
      padding: EdgeInsets.all(10.0), // 所有方向10像素边距

      padding: EdgeInsets.only(
      top: 10.0, 
      left: 20.0  
      ), // 左10,上20像素边距

      padding: EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 5.0
      ), // 垂直20,水平5像素边距 
      )`
1.导航路由go_router
2.表单交互
3.状态管理
  provider -> https://github.com/rrousselGit/provider/blob/master/resources/translations/zh-CN/README.md
  链接1: https://juejin.cn/post/6844903864852807694
  链接2: https://juejin.cn/post/6844904145774870536
  在 Provider.o 中获取 Model 的方式会影响刷新范围,会刷新整个页面。所以，请尽量使用 Consumer 来获取祖先 Model，以维持最小刷新范围。
  Selector相较于 Cosumer，提供了更细粒度的刷新控制。某个组件只关心Model中某个数据变化，可以考虑用Selector，即整体与局部。特别需要指明的是selector的结果，必须是不可变的对象。 如果同一个对象，只是改变对象属性，那shouldRebuild的两个值永远是相等的。selector的结果，必须是不可变的对象
      作者：mwq30123
      链接：https://juejin.cn/post/6844904145774870536
      来源：稀土掘金
      著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

4.序列化 -> https://flutter.cn/docs/data-and-backend/serialization/json
      使用json_annotation以及自动生成分布类!!!
      flutter pub add json_annotation
      flutter pub add --dev build_runner
      flutter pub add --dev json_serializable
      flutter packages pub run build_runner build
      flutter pub run build_runner build --编译
      flutter pub run build_runner watch 启动监听持续生成代码
5.持久化 -> https://flutter.cn/docs/cookbook/persistence/key-value
      保存用户数据，保存设置选项，主题
      kv: shared_preferences
      sqlite: sqflite 
6.网络&HTTP -> https://flutter.cn/docs/data-and-backend/networking
      http: dio //https://github.com/cfug/dio/blob/main/dio/README-ZH.md
      websocket: web_socket_channel
7.资源&媒体
      local: assess_path
      remote: Image.network()
设置
  主题 深色&浅色&随系统
  国际化 中文&英文&随系统 https://flutter.cn/docs/accessibility-and-localization/internationalization
  支持中文字体！！！ https://flutter.cn/docs/cookbook/design/fonts

打包部署
   计算sha1
   keystore
.百度地图(android&ios) -> https://lbsyun.baidu.com/faq/api?title=flutter/loc/guide/solocationMany
  keystore
  sha1

打开iOS模拟器
open -a Simulator
flutter run

在浏览器中运行
flutter run -d chrome