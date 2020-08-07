part of 'room_carousel_cubit.dart';

enum RoomCarouselStatus { loading, success, failure }

class RoomCarouselState extends Equatable {
  const RoomCarouselState({
    this.status = RoomCarouselStatus.loading,
    this.rooms = const <Room>[],
    this.selectedRoom = Room.empty,
  });

  final RoomCarouselStatus status;
  final List<Room> rooms;
  final Room selectedRoom;

  @override
  List<Object> get props => [status, rooms, selectedRoom];

  RoomCarouselState copyWith({
    RoomCarouselStatus status,
    List<Room> rooms,
    Room selectedRoom,
  }) {
    return RoomCarouselState(
      status: status ?? this.status,
      rooms: rooms ?? this.rooms,
      selectedRoom: selectedRoom ?? this.selectedRoom,
    );
  }
}

