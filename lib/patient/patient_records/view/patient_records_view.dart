import 'package:criticalcare/patient/patient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patient_repository/patient_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';


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

class _PatientRecordsFailureView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong!'));
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
      children: [
        Container(
          width: double.infinity,
          height: 24,
          color: Theme.of(context).highlightColor,
          child: Center(
            child: RichText(
              text: TextSpan(
                text: 'Records',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30.0, top: 10, bottom: 5),
                    child: Text('August ${Random().nextInt(10)+1}, 2020',
                        style: Theme.of(context).textTheme.headline4),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, bottom: 5),
                    child: Text('Intensive Care Unit',
                        style: Theme.of(context).textTheme.headline3),
                  ),
                ],
              ),
            ],
          ),
        ]),
        Column(
          children: patientRecords.map(
            (record) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
                child: Container(
                  width: double.infinity,
                  // height: 1,
                  child: _RecordView(
                    record: record,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
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
    return Card(
      color: Theme.of(context).highlightColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _RecordHeader(type: record.type),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 10, bottom: 5),
          child:
              Text(record.info, style: Theme.of(context).textTheme.headline4),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, bottom: 5),
          child:
              Text(record.status, style: Theme.of(context).textTheme.headline3),
        ),
      ]),
    );
  }
}

class _RecordHeader extends StatelessWidget {
  const _RecordHeader({
    Key key,
    @required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
      child: Container(
        decoration: BoxDecoration(
            color: type.toColor,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  0.15,
                ],
                colors: [
                  Colors.grey[400],
                  type.toColor,
                ])),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 4.0,
                  top: 4.0,
                  bottom: 4.0,
                ),
                child: type.toIcon,
              ),
              Text('$type', style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ),
      ),
    );
  }
}

extension on String {
  Color get toColor {
    switch (this) {
      case 'Immunizations':
        return const Color(0xFFA3C5FF);
      case 'Allergies':
        return const Color(0xFFB480FF);
      case 'Medications':
        return const Color(0xFFFFA48B);
      case 'Lab Results':
        return const Color(0xFFF3A9FF);
      default:
        return Colors.blueGrey;
    }
  }
}

extension on String {
  FaIcon get toIcon {
    switch (this) {
      case 'Immunizations':
        return const FaIcon(FontAwesomeIcons.syringe);
      case 'Allergies':
        return const FaIcon(FontAwesomeIcons.virus);
      case 'Medications':
        return const FaIcon(FontAwesomeIcons.capsules);
      case 'Lab Results':
        return const FaIcon(FontAwesomeIcons.vials);
      default:
        return const FaIcon(FontAwesomeIcons.home);
    }
  }
}
