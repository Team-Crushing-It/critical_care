import 'dart:async';

import 'package:patient_api_client/patient_api_client.dart';

import 'models/models.dart';

/// Exception thrown when a error occurs while fetching patient info.
class GetPatientFailure implements Exception {}

/// {@template patient_repository}
/// Manages the patient domain
/// and exposes methods to query patient information.
/// {@endtemplate}
class PatientRepository {
  /// {@macro patient_repository}
  PatientRepository({PatientApiClient patientApiClient})
      : _patientApiClient = patientApiClient ?? PatientApiClient();

  final PatientApiClient _patientApiClient;

  /// Returns a [PatientModel] model for a given [patientId].
  ///
  /// Can throw a [GetPatientFailure] if an error occurs.
  Future<PatientModel> getPatient(String patientId) async {
    try {
      final patientEntity = await _patientApiClient.getPatient(patientId);
      return PatientModel.fromEntity(patientEntity);
    } on Exception {
      throw GetPatientFailure();
    }
  }

  Future<PatientModel> getPatientRecords(String patientId) async {
    try {
      final patientEntity =
          await _patientApiClient.getPatientRecords(patientId);
      return PatientModel.fromEntity(patientEntity);
    } on Exception {
      throw GetPatientFailure();
    }
  }

  Stream<Art> art(String patientId) {
    return _patientApiClient
        .art(patientId)
        .map((entity) => Art.fromEntity(entity));
  }
}
