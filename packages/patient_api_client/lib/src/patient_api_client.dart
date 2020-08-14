import 'dart:async';
import 'dart:math';

import 'models/models.dart';

/// {@template patient_api_client}
/// Patient API Client
/// {@endtemplate}
class PatientApiClient {
  /// {@macro patient_api_client}
  PatientApiClient();

  final _artController = StreamController<ArtEntity>();

  /// Retrieve a list of supported patient.
  Future<PatientEntity> getPatient(String patientId) {
    // ignore: todo
    /// TODO: Integrate with real API
    return Future.delayed(
      const Duration(seconds: 0),
      () => PatientEntity(id: patientId),
    );
  }

/// Retrieve a list of supported patient.
  Future<PatientEntity> getPatientRecords(String patientId) {
    // ignore: todo
    /// TODO: Integrate with real API
    return Future.delayed(
      const Duration(seconds: 0),
      () => PatientEntity(id: patientId),
    );
  }

  /// Stream of Arterial Blood Pressure Data for a given [patientId].
  Stream<ArtEntity> art(String patientId) {
    Timer.periodic(const Duration(seconds: 1), (_) {
      final low = Random().nextInt(1) * 100;
      final high = low + Random().nextInt(1) * 10;
      _artController.add(
        ArtEntity(
          lowBloodPressure: low,
          highBloodPressure: high,
        ),
      );
    });
    return _artController.stream;
  }
}
