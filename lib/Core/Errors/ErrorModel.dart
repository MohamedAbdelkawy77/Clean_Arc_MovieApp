import 'package:equatable/equatable.dart';

class Errormodel extends Equatable {
  final int status_code;
  final String status_message;
  final bool success;

  Errormodel(
      {required this.status_code,
      required this.status_message,
      required this.success});
  factory Errormodel.fromJson(Map<String, dynamic> data) {
    return Errormodel(
        status_code: data["status_code"], status_message: data["status_message"], success: data["success"]);
  }

  @override
  List<Object?> get props => [status_code, status_message, success];
}
