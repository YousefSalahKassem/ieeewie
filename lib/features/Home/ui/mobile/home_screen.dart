import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ieeewie/core/themes/color.dart';
import 'package:ieeewie/features/Auth/blocs/profile_notifier.dart';
import 'package:ieeewie/features/Auth/blocs/update_profile_provider.dart';
import 'package:ieeewie/features/Home/models/custom_bottom_bar_item.dart';
import 'package:ieeewie/features/Home/ui/mobile/explore_page.dart';
import 'package:ieeewie/features/Home/ui/mobile/home_page.dart';
import 'package:ieeewie/features/Home/ui/mobile/profile_page.dart';
import 'package:ieeewie/features/Home/ui/mobile/saved_page.dart';
import 'package:ieeewie/features/Home/ui/widgets/custom_botton_nav.dart';
import 'package:ieeewie/features/Home/ui/widgets/fade_indexed_stack.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(UpdateProfileProvider.provider, (previous, next) {
      if(next.isSuccess){
        ref.read(ProfileNotifier.provider.notifier).getCurrentUser();
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FadeIndexedStack(
        index: ref.watch(currentIndex),
        children: const [
          HomePage(),
          ExplorePage(),
          SavedPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(
        margin: const EdgeInsets.all(10),
        items: CustomBottomBarItem.bottomNavItems,
        currentIndex: ref.watch(currentIndex),
        onTap: (index) {
          ref.read(currentIndex.notifier).state = index;
        },
        selectedColorOpacity: 1,
        selectedItemColor: AppColors.secondaryColor,
        unselectedItemColor: Colors.transparent,
        itemShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

final currentIndex = StateProvider.autoDispose<int>((ref) => 0);
