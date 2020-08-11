import 'package:criticalcare/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_repository/patient_repository.dart';

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

  final List<PatientRecordsModel> patientRecords;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: patientRecords.map(
        (record) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              width: 100,
              height: 100,
              child: _RecordView(
                record: record,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class _RecordView extends StatelessWidget {
  const _RecordView({
    Key key,
    @required this.record,
  }) : super(key: key);

  final PatientRecordsModel record;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('type: ${record.type}',
          style: Theme.of(context).textTheme.bodyText1),
          Text('type: ${record.info}',
          style: Theme.of(context).textTheme.bodyText1),
          Text('type: ${record.status}',
          style: Theme.of(context).textTheme.bodyText1),
    ]);
  }
}

class _PatientRecordsFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
  }
}
