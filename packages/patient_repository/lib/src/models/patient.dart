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
    this.records = const <PatientRecordModel>[],
  })  : assert(id != null),
        assert(profile != null),
        assert(status != null);

  /// Converts [PatientEntity] into [PatientModel].
  factory PatientModel.fromEntity(PatientEntity entity) {
    return PatientModel(
      id: entity.id,
      profile: getPatientProfile(entity.id),
      status: PatientStatusModel.values[Random().nextInt(3)],
    );
  }

  /// Unique identifier for a given [PatientModel].
  final String id;

  final PatientProfileModel profile;

  final PatientStatusModel status;

  final List<PatientRecordModel> records;

}

enum Gender { male, female, other }

enum Race {
  latino,
  white,
  black,
  asian,
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

  final String name;
  final Gender gender;
  final Race race;
  final String language;
  final int age;
  final DateTime dateOfBirth;
  final String primaryCareDoctorId;
  final String photoUrl;
}

enum PatientStatusModel { critical, needsAttention, stable }

abstract class PatientRecordModel {}

class AllergyRecord extends PatientRecordModel {}

class MedicationRecord extends PatientRecordModel {}

class ImmunizationRecord extends PatientRecordModel {}

class LabRecord extends PatientRecordModel {}
