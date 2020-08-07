import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PatientProfile extends Equatable {
  PatientProfile({
    @required this.id,
    @required this.name,
    @required this.age,
    @required this.dob,
    @required this.gender,
    @required this.language,
  });

  final String id;
  final String name;
  final int age;
  final String dob;
  final String gender;
  final String language;

  PatientProfile copyWith({
    String id,
    String name,
    int age,
    String dob,
    String gender,
    String language,
  }) {
    return PatientProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      language: language ?? this.language,
    );
  }

  @override
  //compare different instances of patient profile
  List<Object> get props => [id, name, age, dob, gender, language];
}
