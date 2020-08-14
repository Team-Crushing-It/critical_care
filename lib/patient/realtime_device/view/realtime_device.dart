import 'package:criticalcare/patient/realtime_device/cubit/realtime_device_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_repository/patient_repository.dart';
import 'package:criticalcare/patient/realtime_device/widgets/widgets.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RealtimeDeviceView extends StatelessWidget {
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

class _RealtimeDeviceSuccessView extends StatelessWidget {
  const _RealtimeDeviceSuccessView({
    Key key,
    @required this.devices,
  }) : super(key: key);

  final List<RealtimeDeviceModel> devices;

  void _handleTapCamera() {
    print('camera plz');
  }

  @override
  Widget build(BuildContext context) {
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
          children: devices.map(
            (device) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: Container(
                  width: double.infinity,
                  // height: 1,
                  child: _DeviceView(
                    device: device,
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

// This is where you begin===========================================================================

class _DeviceView extends StatefulWidget {
  const _DeviceView({
    Key key,
    @required this.device,
  }) : super(key: key);

  final RealtimeDeviceModel device;

  @override
  __DeviceViewState createState() => __DeviceViewState();
}

class __DeviceViewState extends State<_DeviceView> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    final type = widget.device.type;

    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 90,
              color: _active
                  ? const Color(0xFFC4C4C4).withOpacity(0.1)
                  : Colors.transparent,
              child: InkWell(
                onTap: _handleTap,
                child: SizedBox(
                  width: 100,
                  height: 80,
                  child: Stack(alignment: Alignment.center, children: [
                    Image.network(
                      widget.device.graph,
                      fit: BoxFit.cover,
                    ),
                    Container(
                        alignment: Alignment(0.9, -0.8),
                        child: Text(
                          widget.device.range1,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 7.0),
                        )),
                    Container(
                      alignment: Alignment(0.9, 0.78),
                      child: Text(
                        widget.device.range2,
                        style: TextStyle(
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
                                          color: widget.device.type.toColor)),
                              Text('(${widget.device.unit})',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          color: widget.device.type.toColor)),
                              Text(widget.device.range1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          color: widget.device.type.toColor)),
                              Text(widget.device.range2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1
                                      .copyWith(
                                          color: widget.device.type.toColor)),
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
                                .copyWith(color: widget.device.type.toColor)),
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
            height: 100,
            child: LargeChart(type: type),
          ),
        ),
        const Divider(
          color: Color(0xFF303551),
          height: 1,
          thickness: 1,
          endIndent: 0,
        ),
      ],
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
