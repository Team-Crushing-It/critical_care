import 'package:flutter/material.dart';
import 'package:qrcode/qrcode.dart';
import 'package:flutter/scheduler.dart';

class QRCode extends StatefulWidget {
  const QRCode({
    Key key,
    @required this.test,
  }) : super(key: key);

  final VoidCallback test;

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  final QRCaptureController _captureController = QRCaptureController();
  // Animation<Alignment> _animation;
  // AnimationController _animationController;

  bool _popBack = false;

  bool _isTorchOn = false;

  String _captureText = '';

  Future<dynamic> _popTime() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 500));
    widget.test();

    Navigator.of(context).pop();
  }

  @override
  initState() {
    _captureController.onCapture(
      (data) {
        print('onCapture----$data');
        setState(() {
          _captureText = data;

          if (!_popBack) {
            _popBack = true;
            _popTime();
          }
        });
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            child: QRCaptureView(
              controller: _captureController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 56),
            child: AspectRatio(
              aspectRatio: 264 / 258.0,
              child: Stack(
                // alignment: _animation.value,
                children: <Widget>[
                  Image.asset('images/sao@3x.png'),
                  Image.asset('images/tiao@3x.png')
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildToolBar(),
          ),
          Container(
            child: Text('$_captureText'),
          )
        ],
      ),
    );
  }

  Widget _buildToolBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            _captureController.pause();
          },
          child: const Text('pause'),
        ),
        FlatButton(
          onPressed: () {
            if (_isTorchOn) {
              _captureController.torchMode = CaptureTorchMode.off;
            } else {
              _captureController.torchMode = CaptureTorchMode.on;
            }
            _isTorchOn = !_isTorchOn;
          },
          child: const Text('torch'),
        ),
        FlatButton(
          onPressed: () {
            _captureController.resume();
          },
          child: const Text('resume'),
        ),
      ],
    );
  }
}
