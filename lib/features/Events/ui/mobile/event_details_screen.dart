import 'package:animations/animations.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/dialogs/custom_alert_dialog.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/core/helpers/logic_helpers.dart';
import 'package:ieeewie/core/routes/router.gr.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Events/model/event.dart';

part '../widgets/details/event_header.dart';

part '../widgets/details/event_description.dart';

part '../widgets/details/about_event.dart';

part '../widgets/details/event_video_player.dart';

part '../widgets/details/event_images.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _EventHeader(event: event),
                _AboutEvent(event: event),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
                _EventDescription(event: event),
                if ((event.images == null || event.images!.length < 2) &&
                    event.video == null)
                  SizedBox(
                    height: context.heightR(0.1),
                  ),
                if (event.images != null && event.images!.length > 1)
                  _EventImages(event: event),
                if (event.video != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                if (event.video != null)
                  _EventVideoPlayer(videoUrl: event.video!),
              ],
            ),
          ),
          if (event.linkExplore != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Positioned(
                bottom: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    if (isLoggedIn) {
                      await LogicHelpers.launchLink(event.linkExplore);
                    } else {
                      CustomAlertDialog.show(
                        context,
                        title: "You need to login first to explore",
                        onPressed: () async {
                          context.navigateTo(const LoginRoute());
                        },
                        positiveTitle: "Login",
                      );
                    }
                  },
                  child: const Text("Explore"),
                ),
              ),
            )
        ],
      ),
    );
  }
}
