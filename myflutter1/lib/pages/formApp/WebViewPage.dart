// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
// import 'package:webview_flutter_web/webview_flutter_web.dart';

// class WebViewPage extends StatefulWidget {
//   const WebViewPage({Key? key, required this.uri, required this.title})
//       : super(key: key);

//   final Uri uri;
//   final String title;

//   @override
//   _WebViewPageState createState() => _WebViewPageState();
// }

// class _WebViewPageState extends State<WebViewPage> {
//   // late final WebViewController controller;

//   // @override
//   // void initState() {
//   //   super.initState();

//   //   debugPrint('url is :${widget.uri}');

//   //   controller = WebViewController()
//   //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   //     ..setBackgroundColor(const Color(0x00000000))
//   //     ..setNavigationDelegate(NavigationDelegate(onProgress: (int progress) {
//   //       debugPrint('WebView is loading (progress : $progress%');
//   //     }))
//   //     ..loadRequest(widget.uri);
//   // }

//   final PlatformWebViewController _controller = PlatformWebViewController(
//     const PlatformWebViewControllerCreationParams(),
//   )..loadRequest(
//       LoadRequestParams(
//         uri: Uri.parse('https://flutter.cn'),
//       ),
//     );

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //     appBar: AppBar(title: Text(widget.title)),
//     //     body: WebViewWidget(controller: controller));
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView example'),
//         // actions: <Widget>[
//         //   _SampleMenu(_controller),
//         // ],
//       ),
//       body: PlatformWebViewWidget(
//         PlatformWebViewWidgetCreationParams(controller: _controller),
//       ).build(context),
//     );
//     // return WebviewScaffold(
//     //   appBar: new AppBar(
//     //     title: const Text('Widget webview'),
//     //   ),
//     //   withLocalStorage: true,
//     //   url: "https://www.google.cn",
//     //   // 'https://www.baidu.com', // widget.uri.toString(),
//     //   withZoom: true,
//     //   plugin:
//     //   initialChild: Container(
//     //     // color: Colors.redAccent,
//     //     child: const Center(
//     //       child: Text('Waiting.....'),
//     //     ),
//     //   ),
//     // );
//   }
// }
