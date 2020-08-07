import 'package:bloc/bloc.dart';
import 'package:criticalcare/patient/patient.dart';
import 'package:equatable/equatable.dart';
import 'package:patient_repository/patient_repository.dart';

part 'patient_profile_state.dart';

class PatientProfileCubit extends Cubit<PatientProfileState> {
  PatientProfileCubit(this._patientRepository)
      : assert(_patientRepository != null),
        super(const PatientProfileState());

  final PatientRepository _patientRepository;

  Future<void> getPatientProfile(String patientId) async {
    // check if we loaded patient data. Have we loaded data? 
    // make sure we are asked to get new information.
    if (state.patientProfile?.id == patientId) return state;

    // otherwise, throw away the old, bring in the new.
    emit(state.copyWith(status: PatientProfileStatus.loading));
    // this can fail, so we wrap it in try catch
    try {
      // hey repo give me the patient model for this id
      final patient = await _patientRepository.getPatient(patientId);
      // update status and convert model to profile
      emit(
        state.copyWith(
          status: PatientProfileStatus.success,
          patientProfile: patient.toPatientProfile,
        ),
      );
      // in case things go wrong, call 911
    } on Exception {
      emit(state.copyWith(status: PatientProfileStatus.failure));
    }
  }
}

extension on PatientModel {
  PatientProfile get toPatientProfile {
//convert patient model to patient profile
    return PatientProfile(
      name: profile.name,
      id: id,
      age: profile.age,
      gender: profile.gender.toString(),
      dob: profile.dateOfBirth.toString(),
      language: profile.language,
    );
  }
}
