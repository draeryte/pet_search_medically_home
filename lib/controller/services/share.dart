import 'package:share_plus/share_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

class ShareNative {
  void shareThing(String url) {
    Share.share(url);
  }

  shareViaCode(String url, BuildContext context) {
    QrImage newCode = QrImage(
      data: url,
      version: QrVersions.auto,
      size: 200.0,
    );

    Dialog alert = Dialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Share your pet'),
          newCode,
        ],
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
