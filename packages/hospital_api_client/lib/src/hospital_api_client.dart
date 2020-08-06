import 'models/models.dart';

/// {@template hospital_api_client}
/// Hospital API Client
/// {@endtemplate}
class HospitalApiClient {
  /// {@macro hospital_api_client}
  const HospitalApiClient();

  /// Retrieves [HospitalEntity] with given [hospitalId].
  Future<HospitalEntity> getHospital(String hospitalId) {
    /// TODO: Integrate with real API
    return Future.delayed(
      const Duration(seconds: 1),
      () => const HospitalEntity(id: 'hospital-0'),
    );
  }
}
