import 'package:criticalcare/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientRecordsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientRecordsCubit, PatientRecordsState>(
      builder: (context, state) {
        switch (state.status) {
          case PatientRecordsStatus.loading:
            return _PatientRecordsLoadingView();
          case PatientRecordsStatus.success:
            return _PatientRecordsSuccessView(
              patientRecords: state.patientRecords,
            );
          case PatientRecordsStatus.failure:
          default:
            return _PatientRecordsFailureView();
        }
      },
    );
  }
}

class _PatientRecordsLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _PatientRecordsSuccessView extends StatelessWidget {
  const _PatientRecordsSuccessView({
    Key key,
    @required this.patientRecords,
  }) : super(key: key);

  final PatientRecords patientRecords;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Date of Birth: ${patientRecords.type}',
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PatientRecordsFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
  }
}
