import 'package:meta/meta.dart';

enum RoomStatus { red, yellow, green, none }

class Room {
  const Room({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.status,
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
}
