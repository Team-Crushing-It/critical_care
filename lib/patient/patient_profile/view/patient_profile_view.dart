import 'package:criticalcare/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientProfileCubit, PatientProfileState>(
      builder: (context, state) {
        switch (state.status) {
          case PatientProfileStatus.loading:
            return _PatientProfileLoadingView();
          case PatientProfileStatus.success:
            return _PatientProfileSuccessView(
              patientProfile: state.patientProfile,
            );
          case PatientProfileStatus.failure:
          default:
            return _PatientProfileFailureView();
        }
      },
    );
  }
}

class _PatientProfileLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _PatientProfileSuccessView extends StatelessWidget {
  const _PatientProfileSuccessView({
    Key key,
    @required this.patientProfile,
  }) : super(key: key);

  final PatientProfile patientProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(patientProfile.id)],
    );
  }
}

class _PatientProfileFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
  }
}
