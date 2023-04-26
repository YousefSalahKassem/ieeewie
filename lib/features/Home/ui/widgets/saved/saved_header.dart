part of '../../mobile/saved_page.dart';

class _SavedHeader extends StatelessWidget {
  const _SavedHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saved",
              style: GoogleFonts.lora(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
                height: 1,
              ),
            ),
            Text(
              "Let’s add to favourite",
              style: GoogleFonts.nunito(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                height: 0,
              ),
            )
          ],
        ),
      ],
    );
  }
}
