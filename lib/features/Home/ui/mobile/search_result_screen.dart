import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ieeewie/core/blocs/providers/general_notifiers.dart';
import 'package:ieeewie/core/components/app_text_field.dart';
import 'package:ieeewie/core/components/custom_app_bar.dart';
import 'package:ieeewie/core/helpers/app_svg.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Home/blocs/recent_search_notifier.dart';
import 'package:ieeewie/features/Home/ui/widgets/explore/search_results.dart';

part '../widgets/explore/search_bar.dart';

class SearchResultScreen extends ConsumerWidget {
  const SearchResultScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Explore"),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              SizedBox(
                height: 8,
              ),
              _SearchBar(),
              SizedBox(
                height: 20,
              ),
              SearchResults()
            ],
          ),
        ),
      ),
    );
  }
}
