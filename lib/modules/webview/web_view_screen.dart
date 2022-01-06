import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  
  WebViewScreen(this.url);

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  String url;

  static const String routeName = "/webViewRoute";

  @override
  _WebViewScreenState createState() => _WebViewScreenState();

}

class _WebViewScreenState extends State<WebViewScreen> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("url : ${widget.url}");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Blog'),
      ),
      body: WebView(
        initialUrl: widget.url,
        onWebViewCreated: (WebViewController webViewController) {
          widget._controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print('WebView is loading (progress : $progress%)');
        },
      ),
    );
  }
}
