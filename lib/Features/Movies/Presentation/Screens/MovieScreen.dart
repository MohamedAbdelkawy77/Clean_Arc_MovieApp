import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/Features/Movies/Presentation/Manager/MoodThemeCubit/MoodthemeCubit.dart';

class Moviescreen extends StatelessWidget {
  const Moviescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Moodthemecubit, bool>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<Moodthemecubit>().changeMood();
                    },
                    icon:
                        state ? Icon(Icons.light_mode) : Icon(Icons.dark_mode)),
              ],
            ),
            body: Text("hi"));
      },
    );
  }
}
