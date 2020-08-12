import 'package:meta/meta.dart';

/// {@template patient}
/// Patient Domain Model
/// {@endtemplate}
class RealtimeDeviceEntity {
  /// {@macro patient}
  const RealtimeDeviceEntity({@required this.id}) : assert(id != null);

  /// Unique identifier for a given [RealtimeDeviceEntity].
  final String id;
}
