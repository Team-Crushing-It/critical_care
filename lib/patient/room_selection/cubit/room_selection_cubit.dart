import 'package:bloc/bloc.dart';
import 'package:criticalcare/patient/patient.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_repository/hospital_repository.dart';
import 'package:patient_repository/patient_repository.dart';

part 'room_selection_state.dart';

class RoomSelectionCubit extends Cubit<RoomSelectionState> {
  RoomSelectionCubit(
    this._hospitalRepository,
    this._patientRepository,
  )   : assert(_hospitalRepository != null),
        assert(_patientRepository != null),
        super(const RoomSelectionState());

  final HospitalRepository _hospitalRepository;
  final PatientRepository _patientRepository;

  Future<void> changeRoom(String roomId) async {
    if (state.selectedRoom.id == roomId) return;
    if (state.status == RoomSelectionStatus.success) {
      // do local search
    } else {
      // pull from API and do regular search
    }
  }

  Future<void> getRooms(String hospitalId) async {
    emit(state.copyWith(status: RoomSelectionStatus.loading));
    try {
      final hospital = await _hospitalRepository.getHospital(hospitalId);
      final patients = await Future.wait(
        hospital.rooms.map(
          (room) => _patientRepository.getPatient(room.patientId),
        ),
      );
      final rooms = hospital.rooms.map((room) {
        final patient = patients.firstWhere(
          (patient) => patient.id == room.patientId,
          orElse: () => null,
        );
        return room.toRoom(patient);
      }).toList();
      emit(state.copyWith(
        status: RoomSelectionStatus.success,
        rooms: rooms,
        selectedRoom: rooms.isEmpty ? Room.empty : rooms.first,
      ));
    } on Exception {
      emit(state.copyWith(status: RoomSelectionStatus.failure));
    }
  }
}

extension on RoomModel {
  Room toRoom(PatientModel patient) {
    return patient == null
        ? Room.empty
        : Room(
            id: id,
            name: name,
            imageUrl: patient.profile.photoUrl,
            status: patient.status.toRoomStatus,
          );
  }
}

extension on PatientStatus {
  RoomStatus get toRoomStatus {
    switch (this) {
      case PatientStatus.critical:
        return RoomStatus.red;
      case PatientStatus.needsAttention:
        return RoomStatus.yellow;
      case PatientStatus.stable:
        return RoomStatus.green;
      default:
        return RoomStatus.none;
    }
  }
}
