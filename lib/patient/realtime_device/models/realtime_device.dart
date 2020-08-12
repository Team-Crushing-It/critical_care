import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class RealtimeDevice extends Equatable {
 RealtimeDevice(
      {@required this.id,
      @required this.type,
      @required this.info,
      @required this.status,});

  final String id;
  final String type;
  final String info;
  final String status;


  @override
  //compare different instances of patient profile
  List<Object> get props =>
      [id, type, info, status];
}
