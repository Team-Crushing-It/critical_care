import 'package:meta/meta.dart';

/// {@template patient}
/// Patient Domain Model
/// {@endtemplate}
class PatientEntity {
  /// {@macro patient}
  const PatientEntity({@required this.id}) : assert(id != null);

  /// Unique identifier for a given [PatientEntity].
  final String id;
}
