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
      children: [
        Container(
          width: double.infinity,
          height: 24,
          color: Theme.of(context).highlightColor,
          child: Center(
            child: RichText(
              text: TextSpan(
                text:
                    '${patientProfile.name} - ${patientProfile.gender} - Age: ${patientProfile.age} ',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Language: ${patientProfile.language}',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text('Date of Birth: ${patientProfile.dob}',
                  style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ],
    );
  }
}

class _PatientProfileFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
  }
}
