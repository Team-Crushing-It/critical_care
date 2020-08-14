import 'package:criticalcare/patient/patient.dart';
import 'package:criticalcare/patient/realtime_device/cubit/realtime_device_cubit.dart';
import 'package:criticalcare/patient/realtime_device/view/realtime_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_repository/patient_repository.dart';
import 'package:criticalcare/authentication/authentication.dart';

class PatientTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Provide BLoC to both carousel and profile
        child: MultiBlocProvider(
          providers: [
            BlocProvider<PatientProfileCubit>(
              create: (context) => PatientProfileCubit(
                context.repository<PatientRepository>(),
              ),
            ),
            BlocProvider<PatientRecordsCubit>(
              create: (context) => PatientRecordsCubit(
                context.repository<PatientRepository>(),
              ),
            ),
            BlocProvider<RealtimeDeviceCubit>(
              create: (context) => RealtimeDeviceCubit(
                context.repository<PatientRepository>(),
              ),
            ),
          ],
          child: Column(
            children: [
              RoomCarousel(),
              PatientProfileView(),
              RealtimeDeviceView(),
              PatientRecordsView(),
              InkWell(
                onTap: () {
                  context
                      .bloc<AuthenticationBloc>()
                      .add(AuthenticationLogoutRequested());
                },
                child: const SizedBox(
                  height: 100,
                  width: 100,
                  child: Text('logout'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
