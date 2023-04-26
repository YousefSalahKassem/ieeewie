import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/components/custom_profile_image.dart';
import 'package:ieeewie/core/helpers/app_images.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/features/Home/ui/widgets/home/events_list.dart';

import 'home_screen.dart';


part '../widgets/home/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const _HomeHeader(),
              const SizedBox(height: 20,),
              FadeInUp(child: const EventsList(),),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
