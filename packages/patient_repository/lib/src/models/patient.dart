import 'package:patient_api_client/patient_api_client.dart';
import 'package:meta/meta.dart';

/// {@template patient}
/// Patient Domain Model
/// {@endtemplate}
class PatientModel {
  /// {@macro patient}
  const PatientModel({
    @required this.id,
    @required this.profile,
    @required this.status,
    this.records = const <PatientRecord>[],
  })  : assert(id != null),
        assert(profile != null),
        assert(status != null);

  /// Converts [PatientEntity] into [PatientModel].
  factory PatientModel.fromEntity(PatientEntity entity) {
    return PatientModel(
      id: entity.id,
      profile: PatientProfile(
        age: 41,
        dateOfBirth: DateTime(1979, 12, 03),
        race: Race.latino,
        language: 'Spanish',
        gender: Gender.male,
        primaryCareDoctorId: 'doctor-0',
        photoUrl:
            'https://cdn.discordapp.com/attachments/715724285389308085/740723011249766550/unknown.png',
      ),
      status: PatientStatus.critical,
    );
  }

  /// Unique identifier for a given [PatientModel].
  final String id;

  final PatientProfile profile;

  final PatientStatus status;

  final List<PatientRecord> records;
}

enum Gender { male, female, other }

enum Race {
  latino,
  other,
}

class PatientProfile {
  const PatientProfile({
    @required this.gender,
    @required this.race,
    @required this.language,
    @required this.age,
    @required this.dateOfBirth,
    @required this.primaryCareDoctorId,
    @required this.photoUrl,
  });

  final Gender gender;
  final Race race;
  final String language;
  final int age;
  final DateTime dateOfBirth;
  final String primaryCareDoctorId;
  final String photoUrl;
}

enum PatientStatus { critical, needsAttention, stable }

abstract class PatientRecord {}

class AllergyRecord extends PatientRecord {}

class MedicationRecord extends PatientRecord {}

class ImmunizationRecord extends PatientRecord {}

class LabRecord extends PatientRecord {}
