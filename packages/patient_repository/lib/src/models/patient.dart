import 'dart:math';

import 'package:patient_api_client/patient_api_client.dart';
import 'package:meta/meta.dart';
import 'package:patient_repository/patient_repository.dart';

/// {@template patient}
/// Patient Domain Model
/// {@endtemplate}
class PatientModel {
  /// {@macro patient}
  const PatientModel({
    @required this.id,
    @required this.profile,
    @required this.status,
    @required this.records,
    @required this.devices,
  })  : assert(id != null),
        assert(profile != null),
        assert(status != null),
        assert(records != null),
        assert(devices != null);

  /// Converts [PatientEntity] into [PatientModel].
  factory PatientModel.fromEntity(PatientEntity entity) {
    return PatientModel(
      id: entity.id,
      profile: getPatientProfile(entity.id),
      status: PatientStatusModel.values[Random().nextInt(3)],
      records: getPatientRecords(entity.id),
      devices: getRealtimeDevice(entity.id),
    );
  }

  /// Unique identifier for a given [PatientModel].
  final String id;

  // ignore: public_member_api_docs
  final PatientProfileModel profile;

  // ignore: public_member_api_docs
  final PatientStatusModel status;

  // final List<PatientRecordModel> records;

  // ignore: public_member_api_docs
  final List<PatientRecordsModel> records;

  // ignore: public_member_api_docs
  final List<RealtimeDeviceModel> devices;
}

// ignore: public_member_api_docs
enum Gender { male, female, other }

// ignore: public_member_api_docs
enum Race {
  // ignore: public_member_api_docs
  latino,
  // ignore: public_member_api_docs
  white,
  // ignore: public_member_api_docs
  black,
  // ignore: public_member_api_docs
  asian,
  // ignore: public_member_api_docs
  other,
}

/// some documentation
class PatientProfileModel {
  /// somet documentation
  const PatientProfileModel({
    @required this.name,
    @required this.gender,
    @required this.race,
    @required this.language,
    @required this.age,
    @required this.dateOfBirth,
    @required this.primaryCareDoctorId,
    @required this.photoUrl,
  });

  // ignore: public_member_api_docs
  final String name;
  // ignore: public_member_api_docs
  final Gender gender;
  // ignore: public_member_api_docs
  final Race race;
  // ignore: public_member_api_docs
  final String language;
  // ignore: public_member_api_docs
  final int age;
  // ignore: public_member_api_docs
  final DateTime dateOfBirth;
  // ignore: public_member_api_docs
  final String primaryCareDoctorId;
  // ignore: public_member_api_docs
  final String photoUrl;
}

// ignore: public_member_api_docs
enum PatientStatusModel { critical, needsAttention, stable }

/// {@template patient}
/// Patient Record Domain Model
/// {@endtemplate}
class PatientRecordsModel {
  ///{@macro patient records}
  const PatientRecordsModel({
    @required this.type,
    @required this.info,
    @required this.status,
  });

  // ignore: comment_references
  /// Converts [PatientRecordsEntity] into [PatienRecordstModel].
  factory PatientRecordsModel.fromEntity(PatientRecordsEntity entity) {
    return PatientRecordsModel(
      info: entity.id,
      type: entity.id,
      status: entity.id,
    );
  }
  // ignore: public_member_api_docs
  final String type;
  // ignore: public_member_api_docs
  final String info;
  // ignore: public_member_api_docs
  final String status;
}

/// {@template patient}
/// Realtime Device Domain Model
/// {@endtemplate}
class RealtimeDeviceModel {
  ///{@macro realtime devices}
  const RealtimeDeviceModel({
    @required this.graph,
    @required this.type,
    @required this.unit,
    @required this.range1,
    @required this.range2,
    @required this.value,
    @required this.data,
    this.visible,
  });

  /// Converts [RealtimeDeviceEntity] into [RealtimeDeviceModel].
  factory RealtimeDeviceModel.fromEntity(RealtimeDeviceEntity entity) {
    return RealtimeDeviceModel(
      graph: entity.id,
      type: entity.id,
      unit: entity.id,
      range1: entity.id,
      range2: entity.id,
      value: entity.id,
      data: const <int>[],
      visible: entity.id,
    );
  }
  // ignore: public_member_api_docs
  final String graph;
  // ignore: public_member_api_docs
  final String type;
  // ignore: public_member_api_docs
  final String unit;
  // ignore: public_member_api_docs
  final String range1;
  // ignore: public_member_api_docs
  final String range2;
  // ignore: public_member_api_docs
  final String value;
  // ignore: public_member_api_docs
  final List<int> data;
  // ignore: public_member_api_docs
  final String visible;
}
