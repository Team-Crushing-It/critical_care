part of 'patient_profile_cubit.dart';

enum PatientProfileStatus { loading, success, failure }

class PatientProfileState extends Equatable {
  const PatientProfileState({
    this.status = PatientProfileStatus.loading,
    this.patientProfile,
    this.patientRecord,
  });

  final PatientProfileStatus status;
  final PatientProfile patientProfile;
  final PatientRecord patientRecord;

  @override
  List<Object> get props => [status, patientProfile, patientRecord];


  PatientProfileState copyWith({
    PatientProfileStatus status,
    PatientProfile patientProfile,
    PatientRecord patientRecord
  }) {
    return PatientProfileState(
      status: status ?? this.status,
      patientProfile: patientProfile ?? this.patientProfile,
      patientRecord: patientRecord ?? this.patientRecord,
    );
  }
}

