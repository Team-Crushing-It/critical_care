import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PatientRecord extends Equatable {
  PatientRecord(
      {
      @required this.type,
      @required this.info,
      @required this.status,});

  final String type;
  final String info;
  final String status;

  PatientRecord copyWith({
    String type,
    String info,
    String status,
  }) {
    return PatientRecord(
      type: type ?? this.type,
      info: info ?? this.info,
      status: status ?? this.status,
      
    );
  }

  @override
  //compare different instances of patient profile
  List<Object> get props =>
      [type, info, status];
}
