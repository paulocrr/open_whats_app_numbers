import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String whatsAppUrl = 'https://wa.me/';
const String whatsAppApi = 'https://api.whatsapp.com/';

class WhatsAppWebBrowserScreen extends StatefulWidget {
  final String number;
  const WhatsAppWebBrowserScreen({super.key, required this.number});

  @override
  State<WhatsAppWebBrowserScreen> createState() =>
      _WhatsAppWebBrowserScreenState();
}

class _WhatsAppWebBrowserScreenState extends State<WhatsAppWebBrowserScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (request.url.startsWith(whatsAppUrl) ||
                request.url.startsWith(whatsAppApi)) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse('$whatsAppUrl${widget.number}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
