part of '../../mobile/explore_page.dart';

class _RecentSearch extends ConsumerWidget {
  const _RecentSearch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentData = ref.watch(RecentSearchNotifier.provider);
    final recentController = ref.read(RecentSearchNotifier.provider.notifier);
    if (recentData.isEmpty) {
      return Center(
        child: SvgPicture.asset(AppSvg.empty),
      );
    } else {
      return ExpandableNotifier(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Builder(
              builder: (context) {
                final controller = ExpandableController.of(context)!;
                final recentList = ListView.separated(
                  itemCount: controller.expanded
                      ? recentData.length
                      : recentData.take(2).length,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: AppColors.dividerDarkColor,
                      thickness: 1,
                    );
                  },
                  itemBuilder: (context, index) {
                    final title = recentData[index];
                    return ListTile(
                      onTap: () {
                        context.navigateTo(const SearchResultRoute());
                        ref.read(GeneralNotifiers.searchController.notifier).state = title;

                      },
                      dense: true,
                      minVerticalPadding: 0,
                      leading: Text(
                        title,
                        style: GoogleFonts.nunito(
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 0,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          recentController.deleteRecentItem(title);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expandable(
                      controller: controller,
                      collapsed: recentList,
                      expanded: recentList,
                    ),
                    if (recentData.length > 2)
                      const Divider(
                        color: AppColors.dividerDarkColor,
                        thickness: 1,
                      ),
                    if (recentData.length > 2)
                      TextButton(
                        onPressed: () {
                          controller.toggle();
                        },
                        child: Text(
                          controller.expanded ? "Show Less" : "Show All",
                          style: GoogleFonts.nunito(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 0,
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
        ),
      );
    }
  }
}
