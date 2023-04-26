import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ieeewie/core/components/custom_loading_indicator.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24,),
        const CustomLoadingIndicator(
          maxLineHeight: 7,
          radius: 12,
          maxLineWidth: 2,
        ),
        const SizedBox(height: 12,),
        Text(
          "Loading",
          style: GoogleFonts.nunito(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 24,),
      ],
    );
  }
}
