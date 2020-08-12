import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum PatientType { immunizations, medications, allergies, labResults }

class PatientRecords extends Equatable {
  PatientRecords(
      {@required this.id,
      @required this.type,
      @required this.info,
      @required this.status,});

  final String id;
  final PatientType type;
  final String info;
  final String status;


  @override
  //compare different instances of patient profile
  List<Object> get props =>
      [id, type, info, status];
}
