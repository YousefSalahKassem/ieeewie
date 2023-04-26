import 'package:auto_route/auto_route.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ieeewie/core/blocs/providers/general_notifiers.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/routes/router.gr.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Home/blocs/recent_search_notifier.dart';

part '../widgets/explore/explore_header.dart';
part '../widgets/explore/recent_search.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 20,),
            _ExploreHeader(),
            SizedBox(height: 15,),
            _RecentSearch(),
          ],
        ),
      ),
    );
  }
}
