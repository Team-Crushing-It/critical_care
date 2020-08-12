import 'package:meta/meta.dart';

/// {@template hospital}
/// Hospital Domain Model
/// {@endtemplate}
class HospitalEntity {
  /// {@macro hospital}
  const HospitalEntity({@required this.id}) : assert(id != null);

  /// Unique identifier for a given [HospitalEntity].
  final String id;
}
