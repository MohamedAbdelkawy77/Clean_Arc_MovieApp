import 'package:flutter_bloc/flutter_bloc.dart';

class Moodthemecubit extends Cubit<bool> {
  Moodthemecubit() : super(false);

  void changeMood() {
    emit(!state);
  }
}
