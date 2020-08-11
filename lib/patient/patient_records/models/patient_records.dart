import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PatientRecords extends Equatable {
  PatientRecords(
      {@required this.id,
      @required this.type,
      @required this.info,
      @required this.status,});

  final String id;
  final String type;
  final String info;
  final String status;

  PatientRecords copyWith({
    String id,
    String type,
    String info,
    String status,
  }) {
    return PatientRecords(
      id: id ?? this.id,
      type: type ?? this.type,
      info: info ?? this.info,
      status: status ?? this.status,
      
    );
  }

  @override
  //compare different instances of patient profile
  List<Object> get props =>
      [id, type, info, status];
}
