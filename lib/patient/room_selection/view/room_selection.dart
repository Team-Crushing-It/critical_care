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
    final _rooms = [
      ...rooms,
      ...rooms,
      ...rooms,
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _rooms.map(
          (room) {
            final isSelected = room.id == selectedRoom.id;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.green : Colors.black,
                    width: 2,
                  ),
                ),
                position: DecorationPosition.foreground,
                child: _RoomView(room: room),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class _RoomView extends StatelessWidget {
  const _RoomView({
    Key key,
    @required this.room,
    this.onTap,
  }) : super(key: key);

  final Room room;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: ColoredBox(
            color: Colors.grey[300],
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(room.imageUrl),
                ),
                Text(room.name),
              ],
            )),
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
