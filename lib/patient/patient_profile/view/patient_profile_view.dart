import 'package:criticalcare/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'dart:math';

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
                    '${patientProfile.name} - ${_cleanup(patientProfile.gender)} - Age: ${patientProfile.age}',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          Text('Race: ${_cleanup(patientProfile.race)}',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                          'Primary Care Doctor: ${patientProfile.doctor.toDoc}',
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                ),
                Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       Text('Status: Stable',
                    //           style: Theme.of(context).textTheme.bodyText1),
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Awaiting: ${_awaiting()}',
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            //insert image here================================================
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  patientProfile.photo,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  //Convert Enum to string and then uppercase the first letter
  String _cleanup(String word) {
    final r = EnumToString.parse(word);

    return r[0].toUpperCase() + r.substring(1);
  }

  // function for spitting out fake awating status info
  String _awaiting() {
    final x = Random().nextInt(2);
    switch (x) {
      case 0:
        return 'PA init Examination';
      case 1:
        return 'SX Toxicology Report';
      case 2:
        return 'RN Seriological Approval';
      default:
        return 'Intake';
    }
  }
}

// spit out a random doctor
extension on String {
  String get toDoc {
    final x = Random().nextInt(2);

    switch (x) {
      case 0:
        return 'Dr. Farnsworth';
      case 1:
        return 'Dr. Meade';
      case 2:
        return 'Dr. Tallenworth';
      default:
        return 'Dr. Reid';
    }
  }
}

class _PatientProfileFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
  }
}
