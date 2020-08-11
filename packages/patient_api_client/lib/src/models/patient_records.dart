import 'package:meta/meta.dart';

/// {@template patient}
/// Patient Domain Model
/// {@endtemplate}
class PatientRecordsEntity {
  /// {@macro patient}
  const PatientRecordsEntity({@required this.id}) : assert(id != null);

  /// Unique identifier for a given [PatientRecordsEntity].
  final String id;
}
