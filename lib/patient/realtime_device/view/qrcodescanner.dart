import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class QrCodeScanner extends StatefulWidget {
  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  String barcode = '';
  Uint8List bytes = Uint8List(200);

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Device QRCode'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.memory(bytes),
            ),
            Text('RESULT  $barcode'),
            RaisedButton(onPressed: _scan, child: const Text('Scan')),
            RaisedButton(
                onPressed: _scanPhoto, child: const Text('Scan Photo')),
            RaisedButton(
                onPressed: _generateBarCode,
                child: const Text('Generate Barcode')),
          ],
        ),
      ),
    );
  }

  Future _scan() async {
    barcode = await scanner.scan();
    // ignore: unnecessary_this
    setState(() => this.barcode = barcode);
  }

  Future _scanPhoto() async {
    barcode = await scanner.scanPhoto();
    // ignore: unnecessary_this
    setState(() => this.barcode = barcode);
  }

  Future _generateBarCode() async {
    // ignore: omit_local_variable_types
    Uint8List result = await scanner
        .generateBarCode('https://github.com/leyan95/qrcode_scanner');
    // ignore: unnecessary_this
    this.setState(() => this.bytes = result);
  }
}
