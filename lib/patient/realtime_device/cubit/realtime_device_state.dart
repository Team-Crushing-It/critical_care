part of 'realtime_device_cubit.dart';

enum RealtimeDeviceStatus { loading, success, failure }

class RealtimeDeviceState extends Equatable {
  const RealtimeDeviceState({
    this.status = RealtimeDeviceStatus.loading,
    this.realtimeDevice = const <RealtimeDeviceModel>[],
  });

  final RealtimeDeviceStatus status;
  final List<RealtimeDeviceModel> realtimeDevice;

  @override
  List<Object> get props => [status, realtimeDevice];


  RealtimeDeviceState copyWith({
    RealtimeDeviceStatus status,
    List<RealtimeDeviceModel> realtimeDevice,
  }) {
    return RealtimeDeviceState(
      status: status ?? this.status,
      realtimeDevice: realtimeDevice ?? this.realtimeDevice,
    );
  }
}