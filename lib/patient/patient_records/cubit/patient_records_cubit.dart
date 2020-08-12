import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:patient_repository/patient_repository.dart';

part 'patient_records_state.dart';

class PatientRecordsCubit extends Cubit<PatientRecordsState> {
  PatientRecordsCubit(this._patientRepository)
      : assert(_patientRepository != null),
        super(const PatientRecordsState());

  final PatientRepository _patientRepository;

  Future<void> getPatientRecords(String patientId) async {
    // check if we loaded patient data. Have we loaded data?
    // make sure we are asked to get new information.
    // if (state.patientRecords?.id == patientId) return state;

    // otherwise, throw away the old, bring in the new.
    emit(state.copyWith(status: PatientRecordsStatus.loading));
    // this can fail, so we wrap it in try catch

    try {
      // info from patient
      final patient = await _patientRepository.getPatientRecords(patientId);

      emit(
        state.copyWith(
          status: PatientRecordsStatus.success,
          patientRecords: patient.records,
        ),
      );
      // in case things go wrong, call 911
    } on Exception {
      emit(state.copyWith(status: PatientRecordsStatus.failure));
    }
  }
}

// extension on PatientModel {
//   PatientRecords get toPatientRecords {
// //convert patient model to patient Records
//     return PatientRecordsModel(
//       id: id,
//       type: records.,
//       info: records.info,
//       status: records.status,
//     );
//   }
// }
