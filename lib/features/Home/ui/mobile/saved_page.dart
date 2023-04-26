import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Events/blocs/provider/events_local_provider.dart';
import 'package:ieeewie/features/Home/ui/widgets/home/events_card.dart';

part '../widgets/saved/saved_header.dart';

class SavedPage extends ConsumerWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final events = ref.watch(EventsLocalProvider.provider).events;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const _SavedHeader(),
              const SizedBox(height: 15,),

              if (events.isEmpty) Center(
                child: SvgPicture.asset(
                  AppSvg.empty,
                ),
              ) else ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return EventCard(
                    event: event,
                    isHome: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
