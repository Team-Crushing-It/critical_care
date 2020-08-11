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

  final List<PatientRecords> patientRecords;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: patientRecords.map(
        (record) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              width: 60,
              height: 60,
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

  final PatientRecords record;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(record.type),
    );
  }
}

class _PatientRecordsFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
  }
}
