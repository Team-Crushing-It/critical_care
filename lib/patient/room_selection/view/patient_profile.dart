import 'package:criticalcare/patient/room_selection/cubit/room_selection_cubit.dart';
import 'package:criticalcare/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital_repository/hospital_repository.dart';
import 'package:patient_repository/patient_repository.dart';

class RoomSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomSelectionCubit(
        context.repository<HospitalRepository>(),
        context.repository<PatientRepository>(),
      )..getRooms('hospital-0'),
      child: RoomSelectionView(),
    );
  }
}

class RoomSelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomSelectionCubit, RoomSelectionState>(
      builder: (context, state) {
        switch (state.status) {
          case RoomSelectionStatus.loading:
            return _RoomSelectionLoadingView();
          case RoomSelectionStatus.success:
            return _RoomSelectionSuccessView(
              rooms: state.rooms,
              selectedRoom: state.selectedRoom,
            );
          case RoomSelectionStatus.failure:
          default:
            return _RoomSelectionFailureView();
        }
      },
    );
  }
}

class _RoomSelectionLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _RoomSelectionSuccessView extends StatelessWidget {
  const _RoomSelectionSuccessView({
    Key key,
    @required this.rooms,
    @required this.selectedRoom,
  }) : super(key: key);

  final List<Room> rooms;
  final Room selectedRoom;

  @override
  Widget build(BuildContext context) {
    // final _rooms = [
    //   ...rooms,
    // ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: rooms.map(
          (room) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                width: 70,
                height: 70,
                child: _RoomView(
                  room: room,
                  onTap: () {
                    context.bloc<RoomSelectionCubit>().changeRoom(room.id);
                  },
                  selectedRoom: selectedRoom,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class _RoomView extends StatelessWidget {
  const _RoomView({Key key, @required this.room, this.onTap, this.selectedRoom})
      : super(key: key);

  final Room room;
  final VoidCallback onTap;
  final Room selectedRoom;

  @override
  Widget build(BuildContext context) {
    final isSelected = room.id == selectedRoom.id;
    final status = room.status;

    Color _getColor() {
      Color color;
      switch (status) {
        case RoomStatus.green:
          color = Colors.green;
          break;
        case RoomStatus.yellow:
          color = Colors.yellow;
          break;
        case RoomStatus.red:
          color = Colors.red;
          break;
        case RoomStatus.none:
          color = Colors.black;
          break;
      }
      return color;
    }

    return Material(
      child: InkWell(
        onTap: onTap,
        child: ColoredBox(
          color: isSelected ? Colors.blue[400] : Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //decoration around the circle avatar for status
              DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _getColor(),
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                position: DecorationPosition.foreground,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(room.imageUrl),
                ),
              ),
              RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: room.name,
                      style: isSelected
                          ? TextStyle(color: Colors.white)
                          : TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoomSelectionFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
  }
}
