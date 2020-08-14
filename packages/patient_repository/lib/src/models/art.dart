import 'package:meta/meta.dart';
import 'package:patient_api_client/patient_api_client.dart';

// ignore: public_member_api_docs
class Art {
  // ignore: public_member_api_docs
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

  // ignore: public_member_api_docs
  final int highBloodPressure;
  // ignore: public_member_api_docs
  final int lowBloodPressure;
  // ignore: public_member_api_docs
  final int medianBloodPressure;
}
