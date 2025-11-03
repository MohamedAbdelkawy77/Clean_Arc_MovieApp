import 'package:equatable/equatable.dart';

class Gener extends Equatable {
  final String name;
  final int id;

  Gener({required this.name, required this.id});
  factory Gener.fromJson(data) {
    return Gener(name: data["name"], id: data["id"]);
  }

  @override
  List<Object?> get props => [name, id];
}
