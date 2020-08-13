import 'package:criticalcare/patient/realtime_device/cubit/realtime_device_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_repository/patient_repository.dart';

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
      ],
    );
  }
}

// This is where you begin===========================================================================

class _DeviceView extends StatelessWidget {
  const _DeviceView({
    Key key,
    @required this.device,
  }) : super(key: key);

  final RealtimeDeviceModel device;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 33.0, top: 10),
              child: SizedBox(
                width: 100,
                height: 75,
                child: Stack(children: [
                  Image.network(
                    device.graph,
                    fit: BoxFit.cover,
                  ),
                  Container(
                      alignment: Alignment(0.9, -0.8),
                      child: Text(
                        device.range1,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 7.0),
                      )),
                  Container(
                      alignment: Alignment(0.9, 0.78),
                      child: Text(
                        device.range2,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 7.0),
                      )),
                ]),
              ),
            ),
            // SizedBox(width: 11),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(device.type,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            .copyWith(color: device.type.toColor)),
                    Text(device.unit,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: device.type.toColor)),
                    Text(device.range1,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: device.type.toColor)),
                    Text(device.range2,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: device.type.toColor)),
                  ],
                ),
                SizedBox(width: 10),
                Text(device.value,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: device.type.toColor)),
              ],
            ),
          ],
        ),
        Divider(
          color: Color(0xFFC4C4C4),
          height: 25,
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
