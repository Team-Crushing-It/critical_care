import 'package:criticalcare/patient/realtime_device/cubit/realtime_device_cubit.dart';
import 'package:criticalcare/patient/realtime_device/view/qrcodescanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_repository/patient_repository.dart';
import 'package:criticalcare/patient/realtime_device/widgets/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RealtimeDeviceView extends StatelessWidget {
  final bool globe = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RealtimeDeviceCubit, RealtimeDeviceState>(
      builder: (context, state) {
        switch (state.status) {
          case RealtimeDeviceStatus.loading:
            return _RealtimeDeviceLoadingView();
          case RealtimeDeviceStatus.success:
            return _RealtimeDeviceSuccessView(
              devices: state.realtimeDevice,
              context: context,
            );
          case RealtimeDeviceStatus.failure:
          default:
            return _RealtimeDeviceFailureView();
        }
      },
    );
  }
}

class _RealtimeDeviceFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
  }
}

class _RealtimeDeviceLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _RealtimeDeviceSuccessView extends StatefulWidget {
  const _RealtimeDeviceSuccessView({
    Key key,
    @required this.devices,
    @required this.context,
  }) : super(key: key);

  final List<RealtimeDeviceModel> devices;

  final BuildContext context;

  @override
  __RealtimeDeviceSuccessViewState createState() =>
      __RealtimeDeviceSuccessViewState();
}

class __RealtimeDeviceSuccessViewState
    extends State<_RealtimeDeviceSuccessView> {
  void _handleTapCamera() {
    print('camera plz');
    Navigator.push<dynamic>(
      widget.context,
      MaterialPageRoute<dynamic>(
        builder: (context) => QrCodeScanner(test: onReturn),
      ),
    );
  }

  void onReturn() {
    setState(() {
      widget.devices.add(
        const RealtimeDeviceModel(
          graph:
              'https://media.discordapp.net/attachments/703406022953533552/743230366696996995/graph_art.png',
          type: 'Art',
          unit: 'mmHg',
          range1: '120',
          range2: '80',
          value: '120/80',
          data: [
            15,
            23,
            30,
            45,
            53,
            75,
            90,
            93,
            99,
            93,
            78,
            60,
            59,
            38,
            38,
            30,
            26,
            23,
            15,
          ],
          visible: 'true',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final last = widget.devices.length - 1;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 24,
          color: Theme.of(context).highlightColor,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Realtime Monitoring',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        Column(
          children: widget.devices.map(
            (device) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Container(
                  width: double.infinity,
                  // height: 1,
                  child: _DeviceView(
                    device: device,
                    index: widget.devices.indexOf(device),
                    last: last,
                  ),
                ),
              );
            },
          ).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: _handleTapCamera,
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}

// This is where you begin=================================

class _DeviceView extends StatefulWidget {
  const _DeviceView({
    Key key,
    @required this.device,
    @required this.index,
    @required this.last,
    @required this.globe,
  }) : super(key: key);

  final RealtimeDeviceModel device;
  final num index;
  final num last;
  final bool globe;

  @override
  __DeviceViewState createState() => __DeviceViewState();
}

class __DeviceViewState extends State<_DeviceView> {
  bool _active = false;
  bool visible = true;

  @override
  initState() {
    if (widget.index == widget.last ? false : true) {
      visible = false;
    }
    super.initState();
  }

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  // void toggleVisibility() {
  //   setState(() {
  //     visible = !visible;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final _visible = widget.index == widget.last ? false : true;

    return Container(
      child: Visibility(
        visible: _visible,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 90,
                  color: const Color(0xFFC4C4C4).withOpacity(0.1),
                  child: InkWell(
                    onTap: _handleTap,
                    child: SizedBox(
                      width: 100,
                      height: 80,
                      child: Stack(alignment: Alignment.center, children: [
                        // Image.network(
                        //   widget.device.graph,
                        //   fit: BoxFit.cover,
                        // ),
                        IgnorePointer(
                            ignoring: true,
                            child: SmallChart(device: widget.device)),
                        Container(
                            alignment: const Alignment(0.9, -0.8),
                            child: Text(
                              widget.device.range1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 7.0),
                            )),
                        Container(
                          alignment: const Alignment(0.9, 0.78),
                          child: Text(
                            widget.device.range2,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 7.0),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0.0,
                  ),
                  child: SizedBox(
                    // width: 200,
                    height: 90,
                    child: Container(
                      color: const Color(0xFFC4C4C4).withOpacity(0.03),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(widget.device.type,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(
                                              color:
                                                  widget.device.type.toColor)),
                                  Text('(${widget.device.unit})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(
                                              color:
                                                  widget.device.type.toColor)),
                                  Text(widget.device.range1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(
                                              color:
                                                  widget.device.type.toColor)),
                                  Text(widget.device.range2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(
                                              color:
                                                  widget.device.type.toColor)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15.0,
                              right: 15.0,
                            ),
                            child: Text(widget.device.value,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: widget.device.type.toColor)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: _active,
              child: Container(
                color: const Color(0xFFC4C4C4).withOpacity(0.1),
                width: double.infinity,
                height: 150,
                child: LargeChart(
                  device: widget.device,
                ),
              ),
            ),
            const Divider(
              color: Color(0xFF303551),
              height: 1,
              thickness: 1,
              endIndent: 0,
            ),
          ],
        ),
      ),
    );
  }
}

extension on String {
  Color get toColor {
    switch (this) {
      case 'Art':
        return const Color(0xFFD00404);
      case 'LAP':
        return const Color(0xFFD00404);
      case 'HR':
        return const Color(0xFF05FF2D);
      case 'RESP':
        return const Color(0xFFFFF500);
      case 'O2':
        return const Color(0xFFFF6E04);
      default:
        return Colors.blueGrey;
    }
  }
}
