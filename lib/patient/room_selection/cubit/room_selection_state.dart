part of 'room_selection_cubit.dart';

enum RoomSelectionStatus { loading, success, failure }

class RoomSelectionState extends Equatable {
  const RoomSelectionState({
    this.status = RoomSelectionStatus.loading,
    this.rooms = const <Room>[],
    this.selectedRoom = Room.empty,
  });

  final RoomSelectionStatus status;
  final List<Room> rooms;
  final Room selectedRoom;

  @override
  List<Object> get props => [status, rooms, selectedRoom];

  RoomSelectionState copyWith({
    RoomSelectionStatus status,
    List<Room> rooms,
    Room selectedRoom,
  }) {
    return RoomSelectionState(
      status: status ?? this.status,
      rooms: rooms ?? this.rooms,
      selectedRoom: selectedRoom ?? this.selectedRoom,
    );
  }
}
