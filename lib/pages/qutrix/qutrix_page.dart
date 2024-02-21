import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class QutrixPage extends StatelessWidget {
  const QutrixPage({
    super.key,
    required this.qutrix,
  });
  final String qutrix;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(qutrix),
          ),
        ),
      ),
    );
  }
}
