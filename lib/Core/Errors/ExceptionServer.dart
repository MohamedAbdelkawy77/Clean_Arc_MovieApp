import 'package:movieapp/Core/Errors/ErrorModel.dart';

class Exceptionserver  implements Exception {
  final Errormodel errorModel;

  Exceptionserver({required this.errorModel});
}
