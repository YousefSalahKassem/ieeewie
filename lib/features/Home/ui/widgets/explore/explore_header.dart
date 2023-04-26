part of '../../mobile/explore_page.dart';

class _ExploreHeader extends StatelessWidget {
  const _ExploreHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Discover",
              style: GoogleFonts.lora(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                height: 1,
              ),
            ),
            Text(
              "Let’s explore events",
              style: GoogleFonts.nunito(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 0,
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            context.navigateTo(const SearchResultRoute());
          },
          child: Card(
            elevation: 0,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(AppSvg.search),
            ),
          ),
        )
      ],
    );
  }
}
