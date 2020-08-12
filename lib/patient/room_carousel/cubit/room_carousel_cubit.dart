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
     
     // this is a list of patients
      final patients = await Future.wait(
        hospital.rooms.map(
          (room) => _patientRepository.getPatient(room.patientId),
        ),
      );
      
      // this is a list of rooms that get's new things added
      final rooms = hospital.rooms.map((room) {
        // this is a patient model
        // this is just locating the patient that is in the specific room?
        final patient = patients.firstWhere(
          (patient) => patient.id == room.patientId,
          orElse: () => null,
        );
        //  This adds patient to room, converting domains?
        return room.toRoom(patient);
      }).toList();

      //  finally, looks like we are pushing a list of rooms
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
