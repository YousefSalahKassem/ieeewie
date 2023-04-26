import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/components/custom_profile_image.dart';
import 'package:ieeewie/core/dialogs/custom_alert_dialog.dart';
import 'package:ieeewie/core/dialogs/network_alert_dialog.dart';
import 'package:ieeewie/core/helpers/app_images.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/helpers/logic_helpers.dart';
import 'package:ieeewie/core/routes/router.gr.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Auth/blocs/auth_provider.dart';
import 'package:ieeewie/features/Home/models/profile_options_model.dart';
import 'package:in_app_review/in_app_review.dart';

part '../widgets/profile/profile_header.dart';
part '../widgets/profile/profile_information.dart';
part '../widgets/profile/profile_options.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const [
            _ProfileHeader(),
            SizedBox(height: 20,),
            _ProfileInformation(),
            SizedBox(height: 20,),
            _ProfileOptions(),

          ],
        ),
      ),
    );
  }
}
