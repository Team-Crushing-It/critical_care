import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patient_repository/patient_repository.dart';


part 'realtime_device_state.dart';


class RealtimeDeviceCubit extends Cubit<RealtimeDeviceState> {
  RealtimeDeviceCubit(this._patientRepository)
      : assert(_patientRepository != null),
        super(const RealtimeDeviceState());

  final PatientRepository _patientRepository;

  Future<void> getRealtimeDevice(String patientId) async {
    // check if we loaded patient data. Have we loaded data?
    // make sure we are asked to get new information.
    // if (state.RealtimeDevice?.id == patientId) return state;

    // otherwise, throw away the old, bring in the new.
    emit(state.copyWith(status: RealtimeDeviceStatus.loading));
    // this can fail, so we wrap it in try catch

    try {
      // info from patient
      final patient = await _patientRepository.getRealtimeDevice(patientId);

      emit(
        state.copyWith(
          status: RealtimeDeviceStatus.success,
          realtimeDevice: patient.devices,
        ),
      );
      // in case things go wrong, call 911
    } on Exception {
      emit(state.copyWith(status: RealtimeDeviceStatus.failure));
    }
  }
}