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
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
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
    return Text(device.type, style: Theme.of(context).textTheme.headline4);
  }
}
