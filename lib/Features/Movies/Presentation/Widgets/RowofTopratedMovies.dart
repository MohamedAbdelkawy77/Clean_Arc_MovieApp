import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowofTopratedMovies extends StatelessWidget {
  const RowofTopratedMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Top Rated",
          style: GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ),
        ),
        InkWell(
          onTap: () {
            /// TODO : NAVIGATION TO Top Rated Movies Screen
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Text('See More'),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

