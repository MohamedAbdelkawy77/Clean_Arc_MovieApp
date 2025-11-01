import 'package:flutter/material.dart';

class ColumnoverthemainMovie extends StatelessWidget {
  const ColumnoverthemainMovie({
    Key? key,
    required this.Title,
  }) : super(key: key);
  final String Title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.circle,
                color: Colors.redAccent,
                size: 16.0,
              ),
              const SizedBox(width: 4.0),
              Text(
                'Now Playing'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            Title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ],
    );
  }
}
