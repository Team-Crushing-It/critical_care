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
      RoomModel(
        id: 'room-3',
        name: '2-b',
        patientId: 'patient-3',
      ),
      RoomModel(
        id: 'room-4',
        name: '3-a',
        patientId: 'patient-4',
      ),
      RoomModel(
        id: 'room-5',
        name: '3-b',
        patientId: 'patient-5',
      ),
      RoomModel(
        id: 'room-6',
        name: '5',
        patientId: 'patient-6',
      ),
      RoomModel(
        id: 'room-7',
        name: '6',
        patientId: 'patient-7',
      ),
      RoomModel(
        id: 'room-8',
        name: '7',
        patientId: 'patient-8',
      ),
      RoomModel(
        id: 'room-9',
        name: '8',
        patientId: 'patient-9',
      ),
      RoomModel(
        id: 'room-10',
        name: '9',
        patientId: 'patient-10',
      ),
      RoomModel(
        id: 'room-11',
        name: '10',
        patientId: 'patient-11',
      ),
      RoomModel(
        id: 'room-12',
        name: '11',
        patientId: 'patient-12',
      ),

    ]);
  }

  /// Unique identifier for a given [HospitalModel].
  final String id;

  /// All Rooms in current hospital.
  final List<RoomModel> rooms;
}

/// Room Object
class RoomModel {

/// Room Object is [id], [name]
  const RoomModel({
    @required this.id,
    @required this.name,
    this.patientId,
  });

  final String id;
  final String name;
  final String patientId;
}
