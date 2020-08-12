import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum RoomStatus { red, yellow, green, none }

class Room extends Equatable {
  const Room({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.status,
    this.patientId,
  });

  static const empty = Room(
    id: '-',
    name: '-',
    imageUrl: '-',
    status: RoomStatus.none,
  );

  bool get isEmpty => this == Room.empty;

  final String id;
  final String name;
  final String imageUrl;
  final RoomStatus status;
  final String patientId;

  @override
  List<Object> get props {
    return [
      id,
      name,
      imageUrl,
      status,
      patientId,
    ];
  }
}
