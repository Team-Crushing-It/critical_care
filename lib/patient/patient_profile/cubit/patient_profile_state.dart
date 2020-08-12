part of 'patient_profile_cubit.dart';

enum PatientProfileStatus { loading, success, failure }

class PatientProfileState extends Equatable {
  const PatientProfileState({
    this.status = PatientProfileStatus.loading,
    this.patientProfile,
  });

  final PatientProfileStatus status;
  final PatientProfile patientProfile;


  @override
  List<Object> get props => [status, patientProfile];


  PatientProfileState copyWith({
    PatientProfileStatus status,
    PatientProfile patientProfile,
  }) {
    return PatientProfileState(
      status: status ?? this.status,
      patientProfile: patientProfile ?? this.patientProfile,
    );
  }
}

