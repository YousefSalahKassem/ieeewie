import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ieeewie/core/components/custom_loader.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/features/Events/data/constants/paths.dart';
import 'package:ieeewie/features/Events/model/event.dart';
import 'package:ieeewie/features/Home/ui/widgets/home/events_card.dart';

class EventsList extends ConsumerWidget {
  const EventsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FirestoreListView<Event>(
      query: FirebaseFirestore.instance
          .collection(EventPaths.event)
          .orderBy("startDate", descending: true)
          .withConverter(
        fromFirestore: (snapshot, _) => Event.fromJson(snapshot.data()!),
        toFirestore: (event, _) => event.toJson(),
      ),
      errorBuilder: (context, _, __) {
        return SvgPicture.asset(AppSvg.error);
      },
      emptyBuilder: (context) {
        return SvgPicture.asset(AppSvg.noData);
      },
      loadingBuilder: (context) {
        return Padding(
          padding: EdgeInsets.only(top: context.heightR(0.25)),
          child: const Center(
            child: CustomLoader(),
          ),
        );
      },
      pageSize: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, snapshot) {
        final event = snapshot.data();
        return EventCard(
          event: event,
          isHome: true,
        );
      },
    );
  }
}
