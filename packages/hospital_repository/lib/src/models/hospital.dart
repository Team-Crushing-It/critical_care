import 'package:hospital_api_client/hospital_api_client.dart';
import 'package:meta/meta.dart';

/// {@template hospital_model}
/// Hospital Domain Model
/// {@endtemplate}
class HospitalModel {
  /// {@macro hospital_model}
  const HospitalModel({
    @required this.id,
    this.rooms = const <RoomModel>[],
  }) : assert(id != null);

  /// Converts [HospitalEntity] into [HospitalModel].
  factory HospitalModel.fromEntity(HospitalEntity entity) {
    return HospitalModel(id: entity.id, rooms: const <RoomModel>[
      RoomModel(
        id: 'room-0',
        name: '1-a',
        patientId: 'patient-0',
      ),
      RoomModel(
        id: 'room-1',
        name: '1-b',
        patientId: 'patient-1',
      ),
      RoomModel(
        id: 'room-2',
        name: '2-a',
        patientId: 'patient-2',
      ),
    ]);
  }

  /// Unique identifier for a given [HospitalModel].
  final String id;

  /// All Rooms in current hospital.
  final List<RoomModel> rooms;
}

class RoomModel {
  const RoomModel({
    @required this.id,
    @required this.name,
    this.patientId,
  });

  final String id;
  final String name;
  final String patientId;
}
