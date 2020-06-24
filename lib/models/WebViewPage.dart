import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutterapp/models/sections.dart';

class WebViewPage extends StatefulWidget {
  final Section section;

  const WebViewPage({Key key, this.section}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {

  bool isLoading = true;

  //to load desktop mode
  String jsDesktopMode =
      "document.querySelector('meta[name=\"viewport\"]').setAttribute('content', 'width=1024px, initial-scale=' + (document.documentElement.clientWidth / 1024));";

  FlutterWebviewPlugin flutterWebViewPlugin;


  bool bannerLoaded = false;



  dynamic progress = 0;

  @override
  Widget build(BuildContext context) {
    flutterWebViewPlugin = new FlutterWebviewPlugin();

    flutterWebViewPlugin.onProgressChanged.listen((event) {
      setState(() {
        progress = event * 100;
      });

//      if (widget.section.type == model.Type.WebViewDesktop)
//        flutterWebViewPlugin.evalJavascript(jsDesktopMode);
    });

    return WebviewScaffold(
      appBar: AppBar(
        title: Text(widget.section.title),
        actions: <Widget>[
          Visibility(visible: progress < 100, child: Text("$progress%")),
        ],
      ),
      bottomNavigationBar: Container(
        height: bannerLoaded ? 50.0 : 0.0,
        color: Colors.white,
      ),
      url: widget.section.url.trim(),
      withJavascript: true,

      useWideViewPort: true,
      displayZoomControls: false,
      scrollBar: true,
      withZoom: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    flutterWebViewPlugin?.close();
  }


}
