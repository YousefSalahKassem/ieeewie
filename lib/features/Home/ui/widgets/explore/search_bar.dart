part of '../../mobile/search_result_screen.dart';

class _SearchBar extends ConsumerWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppTextField(
      initalValue: ref.watch(GeneralNotifiers.searchController),
      fillColor: AppColors.searchFieldDarkColor,
      onChanged: (value) {
        ref.read(GeneralNotifiers.searchController.notifier).state =
            value ?? "";
      },
      maxLines: 1,
      onSubmitted: (value){
        if(value !=null && value.trim().isNotEmpty){
          ref.read(RecentSearchNotifier.provider.notifier).addToRecent(value);
        }
        return null;
      },
      hint: "Discover....",
      suffix: Padding(
        padding: const EdgeInsets.all(14),
        child: SvgPicture.asset(
          AppSvg.search,
          color: Colors.grey,
        ),
      ),
      borderRadius: 10,
      borderColor: Colors.white,
    );
  }
}
