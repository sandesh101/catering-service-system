import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class EsewaPage extends StatefulWidget {
  const EsewaPage({super.key});

  @override
  State<EsewaPage> createState() => _EsewaPageState();
}

class _EsewaPageState extends State<EsewaPage> {
  late InAppWebViewController inAppWebViewController;
  String url = 'https://facebook.com/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pay Advance',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(url),
              ),
              onWebViewCreated: (InAppWebViewController controller) {
                inAppWebViewController = controller;
              },
            ),
          ),
        ],
      ),
    );
  }
}
