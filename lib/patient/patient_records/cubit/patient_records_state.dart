part of 'patient_records_cubit.dart';

enum PatientRecordsStatus { loading, success, failure }

class PatientRecordsState extends Equatable {
  const PatientRecordsState({
    this.status = PatientRecordsStatus.loading,
    this.patientRecords = const <PatientRecords>[],
  });

  final PatientRecordsStatus status;
  final List<PatientRecords> patientRecords;

  @override
  List<Object> get props => [status, patientRecords];


  PatientRecordsState copyWith({
    PatientRecordsStatus status,
    List<PatientRecords> patientRecords,
  }) {
    return PatientRecordsState(
      status: status ?? this.status,
      patientRecords: patientRecords ?? this.patientRecords,
    );
  }
}

