import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ieeewie/core/blocs/providers/general_notifiers.dart';
import 'package:ieeewie/core/components/custom_loader.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/helpers/extensions.dart';
import 'package:ieeewie/features/Events/blocs/provider/events_provider.dart';
import 'package:ieeewie/features/Events/model/event.dart';
import 'package:ieeewie/features/Home/ui/widgets/home/events_card.dart';

class SearchResults extends ConsumerWidget {
  const SearchResults();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(GeneralNotifiers.searchController);
    return StreamBuilder<List<Event>>(
      stream: ref.watch(EventsProvider.provider).getEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SvgPicture.asset(AppSvg.error);
        } else if (snapshot.hasData) {
          List<Event> events = snapshot.data!;
          events.sort((a, b) => b.startDate.compareTo(a.startDate));
          events = events
              .where(
                (event) => event.title.toLowerCase().contains(
                      ref
                          .watch(GeneralNotifiers.searchController)
                          .toLowerCase(),
                    ),
              )
              .toList();
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: searchText.isNotEmpty ? events.length : 0,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventCard(
                event: event,
                isHome: true,
              );
            },
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(top: context.heightR(0.25)),
            child: const Center(
              child: CustomLoader(),
            ),
          );
        }
      },
    );
  }
}
