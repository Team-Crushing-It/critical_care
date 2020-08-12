import 'package:hospital_api_client/hospital_api_client.dart';

import 'models/models.dart';

/// Exception thrown when a error occurs while fetching hospitals.
class GetHospitalsFailure implements Exception {}

/// {@template hospital_repository}
/// Manages the hospital domain
/// and exposes methods to query supported hospitals
/// as well as emergency care units for a given hospital
/// {@endtemplate}
class HospitalRepository {
  /// {@macro hospital_repository}
  const HospitalRepository({
    HospitalApiClient hospitalApiClient,
  }) : _hospitalApiClient = hospitalApiClient ?? const HospitalApiClient();

  final HospitalApiClient _hospitalApiClient;

  /// Returns [HospitalModel] information for given [hospitalId].
  ///
  /// Can throw a [GetHospitalsFailure] if an error occurs.
  Future<HospitalModel> getHospital(String hospitalId) async {
    try {
      final hospitalEntity = await _hospitalApiClient.getHospital(hospitalId);
      return HospitalModel.fromEntity(hospitalEntity);
    } on Exception {
      throw GetHospitalsFailure();
    }
  }
}
