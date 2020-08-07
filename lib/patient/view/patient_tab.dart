import 'package:criticalcare/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_repository/patient_repository.dart';

class PatientTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Provide BLoC to both carousel and profile
          child: BlocProvider(
            create: (context) => PatientProfileCubit(
              context.repository<PatientRepository>(),
            ),
            child: Column(
              children: [
                RoomCarousel(),
                PatientProfileView(),
                // ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
