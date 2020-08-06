import 'package:meta/meta.dart';
import 'package:patient_api_client/patient_api_client.dart';

class Art {
  const Art({
    @required this.highBloodPressure,
    @required this.lowBloodPressure,
    @required this.medianBloodPressure,
  });

  /// Convert [ArtEntity] into [Art] model.
  factory Art.fromEntity(ArtEntity entity) {
    return Art(
      highBloodPressure: entity.highBloodPressure,
      lowBloodPressure: entity.lowBloodPressure,
      medianBloodPressure:
          ((entity.highBloodPressure + entity.lowBloodPressure) / 2).round(),
    );
  }

  final int highBloodPressure;
  final int lowBloodPressure;
  final int medianBloodPressure;
}
