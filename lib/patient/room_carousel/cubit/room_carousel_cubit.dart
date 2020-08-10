import 'package:bloc/bloc.dart';
import 'package:criticalcare/patient/patient.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_repository/hospital_repository.dart';
import 'package:patient_repository/patient_repository.dart';

part 'room_carousel_state.dart';

class RoomCarouselCubit extends Cubit<RoomCarouselState> {
  RoomCarouselCubit(
    this._hospitalRepository,
    this._patientRepository,
  )   : assert(_hospitalRepository != null),
        assert(_patientRepository != null),
        super(const RoomCarouselState());

  final HospitalRepository _hospitalRepository;
  final PatientRepository _patientRepository;

  Future<void> changeRoom(String roomId) async {
    if (state.selectedRoom.id == roomId) return;
    if (state.status == RoomCarouselStatus.success) {
      // do local search
      final newRoom = state.rooms.firstWhere(
        (room) => room.id == roomId,
        orElse: () => null,
      );

      emit(state.copyWith(selectedRoom: newRoom));
    }
    // assume you never download in the first place
    // } else {
    //   // pull from API and do regular search
    // }
  }

  Future<void> getRooms(String hospitalId) async {
    //initially say things are loading
    emit(state.copyWith(status: RoomCarouselStatus.loading));
    try {
      // get info from hospital
      final hospital = await _hospitalRepository.getHospital(hospitalId);
      // get info for patients
      final patients = await Future.wait(
        //  map the hospitals to rooms with patients. 
        //  Here we are filling the rooms of the hospital
        hospital.rooms.map(
          (room) => _patientRepository.getPatient(room.patientId),
        ),
      );
      // what is this doing??
      final rooms = hospital.rooms.map((room) {
        final patient = patients.firstWhere(
          (patient) => patient.id == room.patientId,
          orElse: () => null,
        );
        return room.toRoom(patient);
      }).toList();
      //  looks like we are creating a list of rooms. 
      //  Are we correlating the ID's?
      emit(state.copyWith(
        status: RoomCarouselStatus.success,
        rooms: rooms,
        selectedRoom: rooms.isEmpty ? Room.empty : rooms.first,
      ));
    } on Exception {
      emit(state.copyWith(status: RoomCarouselStatus.failure));
    }
  }
}

extension on RoomModel {
  Room toRoom(PatientModel patient) {
    return patient == null
        ? Room.empty
        : Room(
            patientId: patient.id,
            id: id,
            name: name,
            imageUrl: patient.profile.photoUrl,
            status: patient.status.toRoomStatus,
          );
  }
}

extension on PatientStatusModel {
  RoomStatus get toRoomStatus {
    switch (this) {
      case PatientStatusModel.critical:
        return RoomStatus.red;
      case PatientStatusModel.needsAttention:
        return RoomStatus.yellow;
      case PatientStatusModel.stable:
        return RoomStatus.green;
      default:
        return RoomStatus.none;
    }
  }
}
