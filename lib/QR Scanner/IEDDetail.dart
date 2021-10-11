import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class IEDDetail extends StatefulWidget {
  String urlData;
  IEDDetail(this.urlData);

  @override
  IEDDetailState createState() => IEDDetailState();
}

class IEDDetailState extends State<IEDDetail> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff885566),
          title: Text('IED Detail Information')
      ),
      body: WebView(
        initialUrl: widget.urlData,
      ),
    );
  }
}